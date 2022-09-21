--STATS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Project..covidDeathData
where continent is not null 
order by 1,2

--TOTAL DEATH COUNT BY CONTINENT

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From Project..covidDeathData
Where continent is null 
and location not in ('World', 'European Union', 'International','Upper middle income','High income','Lower middle income','Low income')
Group by location
order by TotalDeathCount desc

--PERCENTAGE OF POPULATION INFECTED BY COUNTRY

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Project..covidDeathData
where location not in ('World', 'European Union', 'International','Upper middle income','High income','Lower middle income','Low income')
Group by Location, Population
order by PercentPopulationInfected desc

--PERCENTAGE OF POPULATION INFECTED 

Select continent, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Project..covidDeathData
Where continent is not null 
and continent not in ('World', 'European Union', 'International','Upper middle income','High income','Lower middle income','Low income')
Group by continent, Population, date
order by PercentPopulationInfected desc
