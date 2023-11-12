-- Testing  Relevant data--

SELECT location,total_cases,date, new_cases, total_deaths,population_density
From PortfolioProject..CovidDeath$
WHERE continent IS NOT NULL
ORDER BY 1,2

----Selecting Location,date,Total cases and Total deaths--

Select Location, date, total_cases,total_deaths
From PortfolioProject..CovidDeath$
WHERE total_cases is not null
ORDER BY 1,2

--Total Cases vs Population Of India
-- Shows what percentage of population infected with Covid --

Select location, date, population_density, total_cases,  (total_cases/population_density)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeath$
Where location LIKE 'India';

-- Countries with Highest Infection Rate compared to Population--
Select Location, population_density, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population_density))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeath$
Group by Location,population_density
order by PercentPopulationInfected desc

-- Countries with Highest Death Count per Population--

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeath$
Where continent is not null 
Group by Location
order by TotalDeathCount desc

-- BREAKING THINGS DOWN BY CONTINENT--
-- Showing contintents with the highest death count per population--
Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeath$
Where continent is not null 
Group by continent
order by TotalDeathCount desc

--Total Cases vs Population of Europe
-- Shows what percentage of population infected with Covid--

Select continent, date, population_density, total_cases,  (total_cases/population_density)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeath$
Where continent like 'e%'


--Looking at Total Population V/s vaccination by  using join--

select dea.continent, dea.location, dea.date, dea.population_density, vac.new_vaccinations
from PortfolioProject..CovidDeath$ dea
join PortfolioProject..CovidVaccination$ vac
on dea.location=vac.location
and dea.date= vac.date
where dea.continent is not null 
order by 2,3

--looking at the newly vaccinated people from India--
select  dea.location, dea.date,vac.new_vaccinations
from PortfolioProject..CovidDeath$ dea
join PortfolioProject..CovidVaccination$ vac
on dea.location=vac.location
and dea.date= vac.date
Where dea.location='India'
ORDER by 2,3



	








