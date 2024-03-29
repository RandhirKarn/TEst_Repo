USE [master]
GO
/****** Object:  Database [revkeep]    Script Date: 12-09-2023 13:12:07 ******/
CREATE DATABASE [revkeep]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'revkeep', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\revkeep.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'revkeep_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\revkeep_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [revkeep] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [revkeep].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [revkeep] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [revkeep] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [revkeep] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [revkeep] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [revkeep] SET ARITHABORT OFF 
GO
ALTER DATABASE [revkeep] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [revkeep] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [revkeep] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [revkeep] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [revkeep] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [revkeep] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [revkeep] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [revkeep] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [revkeep] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [revkeep] SET  DISABLE_BROKER 
GO
ALTER DATABASE [revkeep] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [revkeep] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [revkeep] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [revkeep] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [revkeep] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [revkeep] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [revkeep] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [revkeep] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [revkeep] SET  MULTI_USER 
GO
ALTER DATABASE [revkeep] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [revkeep] SET DB_CHAINING OFF 
GO
ALTER DATABASE [revkeep] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [revkeep] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [revkeep] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [revkeep] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [revkeep] SET QUERY_STORE = ON
GO
ALTER DATABASE [revkeep] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [revkeep]
GO
/****** Object:  Table [dbo].[agencies]    Script Date: 12-09-2023 13:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agencies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[division] [nvarchar](50) NULL,
	[active] [bit] NOT NULL,
	[third_party_contractor] [bit] NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[website] [nvarchar](80) NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[contact_name] [nvarchar](150) NULL,
	[contact_title] [nvarchar](50) NULL,
	[contact_email] [nvarchar](50) NULL,
	[contact_phone] [nvarchar](50) NULL,
	[contact_fax] [nvarchar](50) NULL,
	[outgoing_primary_method] [nvarchar](50) NULL,
 CONSTRAINT [PK_agencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agency_outgoing_profile]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency_outgoing_profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agency_id] [int] NULL,
	[fax_number] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[mail_to_name] [nvarchar](50) NULL,
	[mail_to_department] [nvarchar](50) NULL,
	[mail_to_address_1] [nvarchar](50) NULL,
	[mail_to_address_2] [nvarchar](50) NULL,
	[mail_to_city] [nvarchar](50) NULL,
	[mail_to_state] [nvarchar](50) NULL,
	[mail_to_zip] [nvarchar](50) NULL,
	[electronic_website] [nvarchar](80) NULL,
 CONSTRAINT [PK_agency_outgoing_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_levels]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_levels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
	[active] [bit] NULL,
	[order_number] [int] NULL,
	[short_name] [nvarchar](30) NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_appeal_levels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_not_defendable_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_not_defendable_reasons](
	[appeal_id] [int] NOT NULL,
	[not_defendable_reason_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_appeal_not_defendable_reasons] PRIMARY KEY CLUSTERED 
(
	[appeal_id] ASC,
	[not_defendable_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_notes]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_notes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[appeal_id] [int] NULL,
	[notes] [ntext] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_appeal_notes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_reference_numbers]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_reference_numbers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[appeal_id] [int] NULL,
	[reference_number_id] [int] NULL,
	[value] [nvarchar](250) NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_appeal_reference_numbers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
	[active] [bit] NULL,
	[short_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_appeal_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeal_utc_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeal_utc_reasons](
	[appeal_id] [int] NOT NULL,
	[utc_reason_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_appeal_utc_reasons] PRIMARY KEY CLUSTERED 
(
	[appeal_id] ASC,
	[utc_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appeals]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appeals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_id] [int] NULL,
	[appeal_type_id] [int] NULL,
	[appeal_level_id] [int] NULL,
	[defendable] [bit] NULL,
	[letter_date] [date] NULL,
	[received_date] [date] NULL,
	[due_date] [date] NULL,
	[hearing_date] [date] NULL,
	[hearing_time] [time](7) NULL,
	[days_to_respond] [int] NULL,
	[days_to_respond_from_id] [int] NULL,
	[priority] [bit] NULL,
	[assigned] [datetime] NULL,
	[assigned_to] [int] NULL,
	[completed] [datetime] NULL,
	[completed_by] [int] NULL,
	[client_id] [int] NULL,
	[appeal_status] [nvarchar](50) NOT NULL,
	[assigned_to_vendor_id] [int] NULL,
	[cancelled] [datetime] NULL,
	[cancelled_by] [int] NULL,
	[submitted] [datetime] NULL,
	[submitted_by] [int] NULL,
	[closed] [datetime] NULL,
	[closed_by] [int] NULL,
	[unable_to_complete] [bit] NULL,
	[audit_reviewer_id] [int] NULL,
	[agency_id] [int] NULL,
	[audit_identifier] [nvarchar](100) NULL,
 CONSTRAINT [PK_appeals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[articles]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[patient_name] [int] NOT NULL,
	[insuranceProvider] [int] NOT NULL,
	[audit] [int] NOT NULL,
	[agency] [int] NOT NULL,
 CONSTRAINT [PK_articles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[audit_logs]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transaction] [uniqueidentifier] NOT NULL,
	[type] [nvarchar](7) NOT NULL,
	[primary_key] [int] NULL,
	[source] [nvarchar](255) NOT NULL,
	[parent_source] [nvarchar](255) NULL,
	[original] [ntext] NULL,
	[changed] [ntext] NULL,
	[meta] [ntext] NULL,
	[created] [datetime] NULL,
 CONSTRAINT [PK_audit_logs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[audit_reviewers]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_reviewers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[agency_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[professional_degree] [nvarchar](50) NULL,
	[notes] [ntext] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_audit_reviewers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_activity]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_activity](
	[case_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
	[deleted] [datetime] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_case_activity] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_denial_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_denial_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[denial_reason_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_case_denial_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_outcomes]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_outcomes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_case_outcomes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_readmissions]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_readmissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_id] [int] NULL,
	[visit_number] [nvarchar](50) NULL,
	[admit_date] [date] NULL,
	[discharge_date] [date] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_case_readmissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_requests]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_id] [int] NOT NULL,
	[request_type] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[unable_to_complete] [bit] NULL,
	[due_date] [datetime] NULL,
	[completed] [bit] NULL,
	[completed_at] [datetime] NULL,
	[completed_by] [int] NULL,
	[agency_id] [int] NULL,
	[insurance_provider_id] [int] NULL,
	[assigned] [datetime] NULL,
	[assigned_to] [int] NULL,
	[priority] [bit] NULL,
 CONSTRAINT [PK_case_requests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[case_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NULL,
	[short_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_case_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cases]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_type_id] [int] NULL,
	[client_id] [int] NULL,
	[patient_id] [int] NULL,
	[facility_id] [int] NULL,
	[denial_type_id] [int] NULL,
	[case_outcome_id] [int] NULL,
	[insurance_provider_id] [int] NULL,
	[insurance_type_id] [int] NULL,
	[insurance_plan] [nvarchar](250) NULL,
	[total_claim_amount] [decimal](19, 4) NULL,
	[reimbursement_amount] [decimal](19, 4) NULL,
	[disputed_amount] [decimal](19, 4) NULL,
	[settled_amount] [decimal](19, 4) NULL,
	[insurance_number] [nvarchar](50) NULL,
	[visit_number] [nvarchar](50) NULL,
	[admit_date] [date] NULL,
	[discharge_date] [date] NULL,
	[closed] [datetime] NULL,
	[closed_by] [int] NULL,
	[assigned] [datetime] NULL,
	[assigned_to] [int] NULL,
	[client_employee_id] [int] NULL,
	[unable_to_complete] [bit] NULL,
	[discipline_id] [int] NULL,
 CONSTRAINT [PK_cases] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cases_disciplines]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cases_disciplines](
	[case_id] [int] NOT NULL,
	[discipline_id] [int] NOT NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_cases_disciplines] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC,
	[discipline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_employees]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_employee_type_id] [int] NULL,
	[facility_id] [int] NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NULL,
	[work_phone] [nvarchar](50) NULL,
	[mobile_phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[client_id] [int] NULL,
	[npi_number] [bigint] NULL,
	[state] [nvarchar](2) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_client_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_client_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[client_type_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[contact_first_name] [nvarchar](50) NULL,
	[contact_last_name] [nvarchar](50) NULL,
	[contact_department] [nvarchar](50) NULL,
	[contact_title] [nvarchar](50) NULL,
	[contact_phone] [nvarchar](50) NULL,
	[contact_fax] [nvarchar](50) NULL,
	[contact_email] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
	[owner_user_id] [int] NULL,
	[npi_number] [bigint] NOT NULL,
	[subscription_active] [bit] NOT NULL,
	[payment_provider_customer_id] [nvarchar](255) NULL,
	[payment_provider_name] [nvarchar](30) NULL,
	[payment_provider_subscription_id] [nvarchar](30) NULL,
	[subscription_product_id] [nvarchar](30) NULL,
	[licenses] [int] NULL,
	[tos_date] [date] NULL,
	[primary_taxonomy] [nvarchar](50) NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[database_logs]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[database_logs](
	[id] [nchar](10) NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_database_logs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[days_to_respond_froms]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[days_to_respond_froms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_days_to_respond_froms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[denial_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[denial_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NOT NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_denial_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[denial_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[denial_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
	[multiple_service_dates] [bit] NULL,
 CONSTRAINT [PK_denial_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disciplines]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disciplines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[short_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_disciplines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facilities]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facilities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[client_id] [int] NULL,
	[facility_type_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[active] [bit] NULL,
	[npi_number] [bigint] NULL,
	[npi_manual] [bit] NULL,
	[primary_taxonomy] [nvarchar](50) NULL,
	[client_owned] [bit] NULL,
	[chain_name] [nvarchar](255) NULL,
	[area_name] [nvarchar](60) NULL,
	[ou_number] [nvarchar](60) NULL,
	[territory] [nvarchar](60) NULL,
	[rvp_name] [nvarchar](100) NULL,
	[has_contract] [bit] NULL,
	[contract_start_date] [date] NULL,
	[contract_end_date] [date] NULL,
	[indemnification_days] [int] NULL,
	[max_return_work_days] [int] NULL,
 CONSTRAINT [PK_facilities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facilities_services]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facilities_services](
	[facility_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
 CONSTRAINT [PK_facilities_services] PRIMARY KEY CLUSTERED 
(
	[facility_id] ASC,
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facility_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facility_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_facility_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guest_portals]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest_portals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_id] [int] NOT NULL,
	[appeal_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[recipient_name] [nvarchar](100) NULL,
	[description] [nvarchar](250) NULL,
	[last_accessed] [datetime] NULL,
	[expiration_date] [datetime] NULL,
	[completed] [bit] NULL,
	[completed_at] [datetime] NULL,
	[completed_by] [int] NULL,
 CONSTRAINT [PK_guest_portals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[incoming_documents]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[incoming_documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[facility_id] [int] NULL,
	[case_id] [int] NULL,
	[file_name] [nvarchar](255) NULL,
	[assigned] [datetime] NULL,
	[assigned_to] [int] NULL,
	[client_id] [int] NULL,
	[appeal_id] [int] NULL,
	[original_name] [nvarchar](255) NULL,
	[unable_to_complete] [bit] NULL,
 CONSTRAINT [PK_incoming_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_provider_appeal_levels]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_provider_appeal_levels](
	[insurance_provider_id] [int] NOT NULL,
	[appeal_level_id] [int] NOT NULL,
	[client_id] [int] NULL,
	[days_to_respond] [int] NULL,
	[max_days] [int] NULL,
	[agency_id] [int] NULL,
	[label] [nvarchar](100) NULL,
 CONSTRAINT [PK_insurance_provider_appeal_levels] PRIMARY KEY CLUSTERED 
(
	[insurance_provider_id] ASC,
	[appeal_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_provider_appeal_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_provider_appeal_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[insurance_provider_id] [int] NOT NULL,
	[appeal_type_id] [int] NOT NULL,
 CONSTRAINT [PK_insurance_provider_appeal_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_provider_insurance_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_provider_insurance_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[insurance_provider_id] [int] NOT NULL,
	[insurance_type_id] [int] NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_insurance_provider_insurance_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_providers]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_providers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[default_insurance_type_id] [int] NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[active] [bit] NULL,
	[client_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[website] [nvarchar](80) NULL,
 CONSTRAINT [PK_insurance_providers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_types]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[use_provider_guidelines] [bit] NULL,
	[insurance_provider_id] [int] NULL,
 CONSTRAINT [PK_insurance_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[integrations]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[integrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[integration_name] [nvarchar](100) NULL,
	[config_json] [ntext] NULL,
	[description] [nvarchar](250) NULL,
	[last_accessed] [datetime] NULL,
	[expiration_date] [datetime] NULL,
	[enabled] [bit] NULL,
	[connected] [bit] NULL,
 CONSTRAINT [PK_integrations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invite_tokens]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invite_tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[token] [nvarchar](255) NOT NULL,
	[client_id] [int] NULL,
	[vendor_id] [int] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_invite_tokens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[not_defendable_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[not_defendable_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[denial_type_id] [int] NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_not_defendable_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[outgoing_documents]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[outgoing_documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[case_id] [int] NULL,
	[appeal_id] [int] NULL,
	[filename] [nvarchar](250) NULL,
	[delivery_method] [nvarchar](250) NULL,
	[cancelled] [datetime] NULL,
	[cancelled_by] [int] NULL,
	[processed] [datetime] NULL,
	[completed] [datetime] NULL,
	[failed] [datetime] NULL,
	[status_message] [nvarchar](80) NULL,
	[client_id] [int] NULL,
	[agency_id] [int] NULL,
 CONSTRAINT [PK_outgoing_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[date_of_birth] [date] NULL,
	[sex] [nvarchar](16) NULL,
	[marital_status] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[client_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[secured] [bit] NOT NULL,
	[medical_record_number] [nvarchar](50) NULL,
	[ssn_last_four] [nvarchar](4) NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[controller] [nvarchar](50) NOT NULL,
	[action] [nvarchar](50) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[category] [nvarchar](50) NULL,
	[key] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phinxlog]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phinxlog](
	[version] [bigint] NOT NULL,
	[migration_name] [nvarchar](100) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[breakpoint] [bit] NOT NULL,
 CONSTRAINT [PK_phinxlog] PRIMARY KEY CLUSTERED 
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reference_numbers]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reference_numbers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_reference_numbers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
	[client_id] [int] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles_permissions]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_permissions](
	[role_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
 CONSTRAINT [PK_roles_permissions] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[name] [nvarchar](60) NULL,
	[description] [nvarchar](255) NULL,
	[active] [bit] NOT NULL,
	[client_owned] [bit] NULL,
 CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialties]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_specialties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_logins]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_logins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[user_id] [int] NULL,
	[username] [nvarchar](80) NULL,
	[logout] [bit] NULL,
	[success] [bit] NULL,
	[details] [ntext] NULL,
	[ip_address] [nvarchar](60) NULL,
	[hostname] [nvarchar](60) NULL,
	[user_agent] [ntext] NULL,
 CONSTRAINT [PK_user_logins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[first_name] [nvarchar](48) NULL,
	[middle_name] [nvarchar](48) NULL,
	[last_name] [nvarchar](48) NULL,
	[email] [nvarchar](80) NOT NULL,
	[phone] [nvarchar](32) NULL,
	[active] [bit] NULL,
	[admin] [bit] NULL,
	[date_of_birth] [date] NULL,
	[username] [nvarchar](60) NULL,
	[password] [nvarchar](80) NULL,
	[password_changed] [datetime] NULL,
	[password_reset_token] [nvarchar](255) NULL,
	[password_reset_token_expiration] [datetime] NULL,
	[api_token] [nvarchar](60) NULL,
	[last_login] [datetime] NULL,
	[last_login_ip] [nvarchar](50) NULL,
	[last_seen] [datetime] NULL,
	[locked] [bit] NULL,
	[lock_expiration] [datetime] NULL,
	[client_id] [int] NULL,
	[vendor_id] [int] NULL,
	[client_admin] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_users_roles] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utc_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utc_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_utc_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendor_specialties]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor_specialties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[vendor_id] [int] NOT NULL,
	[specialty_id] [int] NOT NULL,
 CONSTRAINT [PK_vendor_specialties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendors]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
	[street_address_1] [nvarchar](50) NULL,
	[street_address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](20) NULL,
	[phone] [nvarchar](50) NULL,
	[owner_user_id] [int] NOT NULL,
	[active] [bit] NULL,
	[tos_date] [date] NULL,
 CONSTRAINT [PK_vendors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[withdrawn_reasons]    Script Date: 12-09-2023 13:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[withdrawn_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	[modified] [datetime] NULL,
	[modified_by] [int] NULL,
	[deleted] [datetime] NULL,
	[deleted_by] [int] NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_withdrawn_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [agencies_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [agencies_active] ON [dbo].[agencies]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [agencies_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [agencies_client_id] ON [dbo].[agencies]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [agencies_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [agencies_deleted] ON [dbo].[agencies]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [agencies_third_party_contractor]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [agencies_third_party_contractor] ON [dbo].[agencies]
(
	[third_party_contractor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [agency_outgoing_profile_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [agency_outgoing_profile_agency_id] ON [dbo].[agency_outgoing_profile]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_levels_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_levels_active] ON [dbo].[appeal_levels]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_levels_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_levels_deleted] ON [dbo].[appeal_levels]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_not_defendable_reasons_appeal_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_not_defendable_reasons_appeal_id] ON [dbo].[appeal_not_defendable_reasons]
(
	[appeal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_not_defendable_reasons_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_not_defendable_reasons_client_id] ON [dbo].[appeal_not_defendable_reasons]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_not_defendable_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_not_defendable_reasons_deleted] ON [dbo].[appeal_not_defendable_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_not_defendable_reasons_not_defendable_reason_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_not_defendable_reasons_not_defendable_reason_id] ON [dbo].[appeal_not_defendable_reasons]
(
	[not_defendable_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_appeal_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_appeal_id] ON [dbo].[appeal_notes]
(
	[appeal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_client_id] ON [dbo].[appeal_notes]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_created_by] ON [dbo].[appeal_notes]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_deleted] ON [dbo].[appeal_notes]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_deleted_by] ON [dbo].[appeal_notes]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_notes_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_notes_modified_by] ON [dbo].[appeal_notes]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_reference_numbers_appeal_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_reference_numbers_appeal_id] ON [dbo].[appeal_reference_numbers]
(
	[appeal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_reference_numbers_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_reference_numbers_client_id] ON [dbo].[appeal_reference_numbers]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_reference_numbers_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_reference_numbers_deleted] ON [dbo].[appeal_reference_numbers]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_reference_numbers_reference_number_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_reference_numbers_reference_number_id] ON [dbo].[appeal_reference_numbers]
(
	[reference_number_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_types_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_types_active] ON [dbo].[appeal_types]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_types_deleted] ON [dbo].[appeal_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_utc_reasons_appeal_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_utc_reasons_appeal_id] ON [dbo].[appeal_utc_reasons]
(
	[appeal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_utc_reasons_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_utc_reasons_client_id] ON [dbo].[appeal_utc_reasons]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_utc_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_utc_reasons_deleted] ON [dbo].[appeal_utc_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeal_utc_reasons_utc_reason_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeal_utc_reasons_utc_reason_id] ON [dbo].[appeal_utc_reasons]
(
	[utc_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_agency_id] ON [dbo].[appeals]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_appeal_level_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_appeal_level_id] ON [dbo].[appeals]
(
	[appeal_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [appeals_appeal_status]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_appeal_status] ON [dbo].[appeals]
(
	[appeal_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_appeal_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_appeal_type_id] ON [dbo].[appeals]
(
	[appeal_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_assigned_to]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_assigned_to] ON [dbo].[appeals]
(
	[assigned_to] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_assigned_to_vendor_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_assigned_to_vendor_id] ON [dbo].[appeals]
(
	[assigned_to_vendor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [appeals_audit_identifier]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_audit_identifier] ON [dbo].[appeals]
(
	[audit_identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_case_id] ON [dbo].[appeals]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_client_id] ON [dbo].[appeals]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_completed_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_completed_by] ON [dbo].[appeals]
(
	[completed_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_created_by] ON [dbo].[appeals]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_deleted] ON [dbo].[appeals]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_deleted_by] ON [dbo].[appeals]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_hearing_date]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_hearing_date] ON [dbo].[appeals]
(
	[hearing_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [appeals_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [appeals_modified_by] ON [dbo].[appeals]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_logs_created]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_created] ON [dbo].[audit_logs]
(
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [audit_logs_parent_source]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_parent_source] ON [dbo].[audit_logs]
(
	[parent_source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_logs_primary_key]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_primary_key] ON [dbo].[audit_logs]
(
	[primary_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [audit_logs_source]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_source] ON [dbo].[audit_logs]
(
	[source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_logs_transaction]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_transaction] ON [dbo].[audit_logs]
(
	[transaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [audit_logs_type]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_logs_type] ON [dbo].[audit_logs]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_reviewers_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_reviewers_active] ON [dbo].[audit_reviewers]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_reviewers_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_reviewers_agency_id] ON [dbo].[audit_reviewers]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [audit_reviewers_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [audit_reviewers_client_id] ON [dbo].[audit_reviewers]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_activity_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_activity_client_id] ON [dbo].[case_activity]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_denial_reasons_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_denial_reasons_case_id] ON [dbo].[case_denial_reasons]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_denial_reasons_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_denial_reasons_client_id] ON [dbo].[case_denial_reasons]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_denial_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_denial_reasons_deleted] ON [dbo].[case_denial_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_denial_reasons_denial_reason_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_denial_reasons_denial_reason_id] ON [dbo].[case_denial_reasons]
(
	[denial_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_outcomes_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_outcomes_deleted] ON [dbo].[case_outcomes]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_readmissions_admit_date_discharge_date]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_readmissions_admit_date_discharge_date] ON [dbo].[case_readmissions]
(
	[admit_date] ASC,
	[discharge_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_readmissions_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_readmissions_case_id] ON [dbo].[case_readmissions]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_readmissions_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_readmissions_client_id] ON [dbo].[case_readmissions]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_readmissions_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_readmissions_deleted] ON [dbo].[case_readmissions]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [case_readmissions_visit_number]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_readmissions_visit_number] ON [dbo].[case_readmissions]
(
	[visit_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_agency_id] ON [dbo].[case_requests]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_assigned_to]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_assigned_to] ON [dbo].[case_requests]
(
	[assigned_to] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_case_id] ON [dbo].[case_requests]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_client_id] ON [dbo].[case_requests]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_completed]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_completed] ON [dbo].[case_requests]
(
	[completed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_insurance_provider_id] ON [dbo].[case_requests]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_priority]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_priority] ON [dbo].[case_requests]
(
	[priority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [case_requests_request_type]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_request_type] ON [dbo].[case_requests]
(
	[request_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [case_requests_unable_to_complete]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [case_requests_unable_to_complete] ON [dbo].[case_requests]
(
	[unable_to_complete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_admit_date_discharge_date]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_admit_date_discharge_date] ON [dbo].[cases]
(
	[admit_date] ASC,
	[discharge_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_case_outcome_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_case_outcome_id] ON [dbo].[cases]
(
	[case_outcome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_created_by] ON [dbo].[cases]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_deleted_by] ON [dbo].[cases]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_denial_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_denial_type_id] ON [dbo].[cases]
(
	[denial_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_facility_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_facility_id] ON [dbo].[cases]
(
	[facility_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_insurance_provider_id] ON [dbo].[cases]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_insurance_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_insurance_type_id] ON [dbo].[cases]
(
	[insurance_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_modified_by] ON [dbo].[cases]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_patient_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_patient_id] ON [dbo].[cases]
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [cases_visit_number]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_visit_number] ON [dbo].[cases]
(
	[visit_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [cases_disciplines_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [cases_disciplines_client_id] ON [dbo].[cases_disciplines]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_client_employee_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_client_employee_type_id] ON [dbo].[client_employees]
(
	[client_employee_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_client_id] ON [dbo].[client_employees]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_created_by] ON [dbo].[client_employees]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_deleted] ON [dbo].[client_employees]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_deleted_by] ON [dbo].[client_employees]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_facility_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_facility_id] ON [dbo].[client_employees]
(
	[facility_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [client_employees_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [client_employees_modified_by] ON [dbo].[client_employees]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_created_by] ON [dbo].[clients]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_deleted] ON [dbo].[clients]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_deleted_by] ON [dbo].[clients]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_modified_by] ON [dbo].[clients]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_owner_user_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_owner_user_id] ON [dbo].[clients]
(
	[owner_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [clients_status]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_status] ON [dbo].[clients]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [clients_subscription_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [clients_subscription_active] ON [dbo].[clients]
(
	[subscription_active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [denial_reasons_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [denial_reasons_client_id] ON [dbo].[denial_reasons]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [denial_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [denial_types_deleted] ON [dbo].[denial_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [denial_types_multiple_service_dates]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [denial_types_multiple_service_dates] ON [dbo].[denial_types]
(
	[multiple_service_dates] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_active] ON [dbo].[facilities]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_client_id] ON [dbo].[facilities]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_created_by] ON [dbo].[facilities]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_deleted] ON [dbo].[facilities]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_deleted_by] ON [dbo].[facilities]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_facility_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_facility_type_id] ON [dbo].[facilities]
(
	[facility_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facilities_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facilities_modified_by] ON [dbo].[facilities]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facility_types_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facility_types_created_by] ON [dbo].[facility_types]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facility_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facility_types_deleted] ON [dbo].[facility_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facility_types_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facility_types_deleted_by] ON [dbo].[facility_types]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facility_types_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [facility_types_modified_by] ON [dbo].[facility_types]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [guest_portals_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [guest_portals_case_id] ON [dbo].[guest_portals]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [guest_portals_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [guest_portals_client_id] ON [dbo].[guest_portals]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [guest_portals_completed]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [guest_portals_completed] ON [dbo].[guest_portals]
(
	[completed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_assigned_to]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_assigned_to] ON [dbo].[incoming_documents]
(
	[assigned_to] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_case_id] ON [dbo].[incoming_documents]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_client_id] ON [dbo].[incoming_documents]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_deleted] ON [dbo].[incoming_documents]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_facility_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_facility_id] ON [dbo].[incoming_documents]
(
	[facility_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [incoming_documents_unable_to_complete]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [incoming_documents_unable_to_complete] ON [dbo].[incoming_documents]
(
	[unable_to_complete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_levels_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_levels_agency_id] ON [dbo].[insurance_provider_appeal_levels]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_levels_appeal_level_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_levels_appeal_level_id] ON [dbo].[insurance_provider_appeal_levels]
(
	[appeal_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_levels_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_levels_client_id] ON [dbo].[insurance_provider_appeal_levels]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_levels_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_levels_insurance_provider_id] ON [dbo].[insurance_provider_appeal_levels]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_types_appeal_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_types_appeal_type_id] ON [dbo].[insurance_provider_appeal_types]
(
	[appeal_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_types_deleted] ON [dbo].[insurance_provider_appeal_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_appeal_types_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_appeal_types_insurance_provider_id] ON [dbo].[insurance_provider_appeal_types]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_insurance_types_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_insurance_types_client_id] ON [dbo].[insurance_provider_insurance_types]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_insurance_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_insurance_types_deleted] ON [dbo].[insurance_provider_insurance_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_insurance_types_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_insurance_types_insurance_provider_id] ON [dbo].[insurance_provider_insurance_types]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_provider_insurance_types_insurance_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_provider_insurance_types_insurance_type_id] ON [dbo].[insurance_provider_insurance_types]
(
	[insurance_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_client_id] ON [dbo].[insurance_providers]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_created_by] ON [dbo].[insurance_providers]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_default_insurance_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_default_insurance_type_id] ON [dbo].[insurance_providers]
(
	[default_insurance_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_deleted] ON [dbo].[insurance_providers]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_deleted_by] ON [dbo].[insurance_providers]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_providers_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_providers_modified_by] ON [dbo].[insurance_providers]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_created_by] ON [dbo].[insurance_types]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_deleted] ON [dbo].[insurance_types]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_deleted_by] ON [dbo].[insurance_types]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_insurance_provider_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_insurance_provider_id] ON [dbo].[insurance_types]
(
	[insurance_provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_modified_by] ON [dbo].[insurance_types]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [insurance_types_use_provider_guidelines]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [insurance_types_use_provider_guidelines] ON [dbo].[insurance_types]
(
	[use_provider_guidelines] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [integrations_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [integrations_client_id] ON [dbo].[integrations]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [not_defendable_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [not_defendable_reasons_deleted] ON [dbo].[not_defendable_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [not_defendable_reasons_denial_type_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [not_defendable_reasons_denial_type_id] ON [dbo].[not_defendable_reasons]
(
	[denial_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_agency_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_agency_id] ON [dbo].[outgoing_documents]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_appeal_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_appeal_id] ON [dbo].[outgoing_documents]
(
	[appeal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_cancelled]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_cancelled] ON [dbo].[outgoing_documents]
(
	[cancelled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_cancelled_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_cancelled_by] ON [dbo].[outgoing_documents]
(
	[cancelled_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_case_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_case_id] ON [dbo].[outgoing_documents]
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_client_id] ON [dbo].[outgoing_documents]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_completed]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_completed] ON [dbo].[outgoing_documents]
(
	[completed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_deleted] ON [dbo].[outgoing_documents]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [outgoing_documents_delivery_method]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_delivery_method] ON [dbo].[outgoing_documents]
(
	[delivery_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [outgoing_documents_failed]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [outgoing_documents_failed] ON [dbo].[outgoing_documents]
(
	[failed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [patients_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [patients_client_id] ON [dbo].[patients]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [patients_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [patients_created_by] ON [dbo].[patients]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [patients_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [patients_deleted] ON [dbo].[patients]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [patients_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [patients_deleted_by] ON [dbo].[patients]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [patients_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [patients_modified_by] ON [dbo].[patients]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permissions_controller]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [permissions_controller] ON [dbo].[permissions]
(
	[controller] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permissions_key]    Script Date: 12-09-2023 13:12:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [permissions_key] ON [dbo].[permissions]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permissions_name]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [permissions_name] ON [dbo].[permissions]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [reference_numbers_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [reference_numbers_deleted] ON [dbo].[reference_numbers]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [roles_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [roles_client_id] ON [dbo].[roles]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [roles_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [roles_deleted] ON [dbo].[roles]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [roles_name]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [roles_name] ON [dbo].[roles]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [roles_permissions_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [roles_permissions_client_id] ON [dbo].[roles_permissions]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [services_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [services_active] ON [dbo].[services]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [services_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [services_client_id] ON [dbo].[services]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [user_logins_logout]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [user_logins_logout] ON [dbo].[user_logins]
(
	[logout] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [user_logins_success]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [user_logins_success] ON [dbo].[user_logins]
(
	[success] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [user_logins_user_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [user_logins_user_id] ON [dbo].[user_logins]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_active]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_active] ON [dbo].[users]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_admin]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_admin] ON [dbo].[users]
(
	[admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_api_token]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_api_token] ON [dbo].[users]
(
	[api_token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_client_admin]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_client_admin] ON [dbo].[users]
(
	[client_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_client_id] ON [dbo].[users]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_created_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_created_by] ON [dbo].[users]
(
	[created_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_deleted] ON [dbo].[users]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_deleted_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_deleted_by] ON [dbo].[users]
(
	[deleted_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_email]    Script Date: 12-09-2023 13:12:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_email] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_locked]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_locked] ON [dbo].[users]
(
	[locked] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_modified_by]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_modified_by] ON [dbo].[users]
(
	[modified_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_username_password]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_username_password] ON [dbo].[users]
(
	[username] ASC,
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_vendor_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_vendor_id] ON [dbo].[users]
(
	[vendor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_roles_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [users_roles_client_id] ON [dbo].[users_roles]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [utc_reasons_client_id]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [utc_reasons_client_id] ON [dbo].[utc_reasons]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [utc_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [utc_reasons_deleted] ON [dbo].[utc_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [withdrawn_reasons_deleted]    Script Date: 12-09-2023 13:12:08 ******/
CREATE NONCLUSTERED INDEX [withdrawn_reasons_deleted] ON [dbo].[withdrawn_reasons]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT ((0)) FOR [client_id]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [division]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT ((1)) FOR [third_party_contractor]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [fax]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [website]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [contact_name]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [contact_title]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [contact_email]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [contact_phone]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [contact_fax]
GO
ALTER TABLE [dbo].[agencies] ADD  DEFAULT (NULL) FOR [outgoing_primary_method]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [agency_id]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [fax_number]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_name]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_department]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_address_1]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_address_2]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_city]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_state]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [mail_to_zip]
GO
ALTER TABLE [dbo].[agency_outgoing_profile] ADD  DEFAULT (NULL) FOR [electronic_website]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT ((0)) FOR [order_number]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [short_name]
GO
ALTER TABLE [dbo].[appeal_levels] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [appeal_id]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [notes]
GO
ALTER TABLE [dbo].[appeal_notes] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [appeal_id]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [reference_number_id]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [value]
GO
ALTER TABLE [dbo].[appeal_reference_numbers] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[appeal_types] ADD  DEFAULT (NULL) FOR [short_name]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeal_utc_reasons] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [case_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [appeal_type_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [appeal_level_id]
GO
ALTER TABLE [dbo].[appeals] ADD  CONSTRAINT [DF_appeals_defendable]  DEFAULT (NULL) FOR [defendable]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [letter_date]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [received_date]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [due_date]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [hearing_date]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [hearing_time]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [days_to_respond]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [days_to_respond_from_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [assigned]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [assigned_to]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [completed]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [completed_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT ('Open') FOR [appeal_status]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [assigned_to_vendor_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [cancelled]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [cancelled_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [submitted]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [submitted_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [closed]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [closed_by]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT ((0)) FOR [unable_to_complete]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [audit_reviewer_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [agency_id]
GO
ALTER TABLE [dbo].[appeals] ADD  DEFAULT (NULL) FOR [audit_identifier]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [primary_key]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [parent_source]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [original]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [changed]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [meta]
GO
ALTER TABLE [dbo].[audit_logs] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT ((0)) FOR [client_id]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT ((0)) FOR [agency_id]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [middle_name]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [professional_degree]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT (NULL) FOR [notes]
GO
ALTER TABLE [dbo].[audit_reviewers] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[case_activity] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_activity] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_activity] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_activity] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[case_denial_reasons] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[case_outcomes] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [case_id]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [visit_number]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [admit_date]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [discharge_date]
GO
ALTER TABLE [dbo].[case_readmissions] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [request_type]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT ((0)) FOR [unable_to_complete]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [due_date]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT ((0)) FOR [completed]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [completed_at]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [completed_by]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [agency_id]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [insurance_provider_id]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [assigned]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT (NULL) FOR [assigned_to]
GO
ALTER TABLE [dbo].[case_requests] ADD  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[case_types] ADD  DEFAULT (NULL) FOR [short_name]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [case_type_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [patient_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [facility_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [denial_type_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [case_outcome_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [insurance_provider_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [insurance_type_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [insurance_plan]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [total_claim_amount]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [reimbursement_amount]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [disputed_amount]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [settled_amount]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [insurance_number]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [visit_number]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [admit_date]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [discharge_date]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [closed]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [closed_by]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [assigned]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [assigned_to]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [client_employee_id]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT ((0)) FOR [unable_to_complete]
GO
ALTER TABLE [dbo].[cases] ADD  DEFAULT (NULL) FOR [discipline_id]
GO
ALTER TABLE [dbo].[cases_disciplines] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [client_employee_type_id]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [facility_id]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [work_phone]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [mobile_phone]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [npi_number]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[client_employees] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[client_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [client_type_id]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [fax]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_first_name]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_last_name]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_department]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_title]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_phone]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_fax]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [contact_email]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [owner_user_id]
GO
ALTER TABLE [dbo].[clients] ADD  CONSTRAINT [DF_clients_npi_number]  DEFAULT (NULL) FOR [npi_number]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT ((0)) FOR [subscription_active]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [payment_provider_customer_id]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [payment_provider_name]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [payment_provider_subscription_id]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [subscription_product_id]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [licenses]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [tos_date]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [primary_taxonomy]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[days_to_respond_froms] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[denial_reasons] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[denial_types] ADD  DEFAULT ((0)) FOR [multiple_service_dates]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[disciplines] ADD  DEFAULT (NULL) FOR [short_name]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [fax]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [npi_number]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [npi_manual]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [primary_taxonomy]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [client_owned]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [chain_name]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [area_name]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [ou_number]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [territory]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [rvp_name]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT ((0)) FOR [has_contract]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [contract_start_date]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [contract_end_date]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [indemnification_days]
GO
ALTER TABLE [dbo].[facilities] ADD  DEFAULT (NULL) FOR [max_return_work_days]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[facility_types] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [recipient_name]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [last_accessed]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [expiration_date]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT ((0)) FOR [completed]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [completed_at]
GO
ALTER TABLE [dbo].[guest_portals] ADD  DEFAULT (NULL) FOR [completed_by]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [facility_id]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [case_id]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [file_name]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [assigned]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [assigned_to]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [appeal_id]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT (NULL) FOR [original_name]
GO
ALTER TABLE [dbo].[incoming_documents] ADD  DEFAULT ((0)) FOR [unable_to_complete]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] ADD  DEFAULT (NULL) FOR [days_to_respond]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] ADD  DEFAULT (NULL) FOR [max_days]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] ADD  DEFAULT (NULL) FOR [agency_id]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] ADD  DEFAULT (NULL) FOR [label]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [insurance_type_id]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [default_insurance_type_id]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [fax]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[insurance_providers] ADD  DEFAULT (NULL) FOR [website]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT ((0)) FOR [use_provider_guidelines]
GO
ALTER TABLE [dbo].[insurance_types] ADD  DEFAULT (NULL) FOR [insurance_provider_id]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [integration_name]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [config_json]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [last_accessed]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT (NULL) FOR [expiration_date]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[integrations] ADD  DEFAULT ((0)) FOR [connected]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT (NULL) FOR [vendor_id]
GO
ALTER TABLE [dbo].[invite_tokens] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [denial_type_id]
GO
ALTER TABLE [dbo].[not_defendable_reasons] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [case_id]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [appeal_id]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [filename]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [delivery_method]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [cancelled]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [cancelled_by]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [processed]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [completed]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [failed]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [status_message]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[outgoing_documents] ADD  DEFAULT (NULL) FOR [agency_id]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [middle_name]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [date_of_birth]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [sex]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [marital_status]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [fax]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT ((0)) FOR [secured]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [medical_record_number]
GO
ALTER TABLE [dbo].[patients] ADD  DEFAULT (NULL) FOR [ssn_last_four]
GO
ALTER TABLE [dbo].[permissions] ADD  DEFAULT (NULL) FOR [category]
GO
ALTER TABLE [dbo].[phinxlog] ADD  DEFAULT (NULL) FOR [migration_name]
GO
ALTER TABLE [dbo].[phinxlog] ADD  DEFAULT (NULL) FOR [start_time]
GO
ALTER TABLE [dbo].[phinxlog] ADD  DEFAULT (NULL) FOR [end_time]
GO
ALTER TABLE [dbo].[phinxlog] ADD  DEFAULT ((0)) FOR [breakpoint]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[reference_numbers] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT ((0)) FOR [client_id]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[services] ADD  DEFAULT (NULL) FOR [client_owned]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[specialties] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT ((0)) FOR [logout]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT ((0)) FOR [success]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [details]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [ip_address]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [hostname]
GO
ALTER TABLE [dbo].[user_logins] ADD  DEFAULT (NULL) FOR [user_agent]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [middle_name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [date_of_birth]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password_changed]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password_reset_token]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password_reset_token_expiration]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [api_token]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_login]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_login_ip]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_seen]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [locked]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [lock_expiration]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [vendor_id]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [client_admin]
GO
ALTER TABLE [dbo].[users_roles] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[utc_reasons] ADD  DEFAULT (NULL) FOR [client_id]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[vendor_specialties] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [street_address_1]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [street_address_2]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [state]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [zip]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [phone]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[vendors] ADD  DEFAULT (NULL) FOR [tos_date]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [created]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [modified]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [modified_by]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [deleted]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [deleted_by]
GO
ALTER TABLE [dbo].[withdrawn_reasons] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons]  WITH CHECK ADD  CONSTRAINT [appeal_not_defendable_reasons_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[appeal_not_defendable_reasons] CHECK CONSTRAINT [appeal_not_defendable_reasons_client_id]
GO
ALTER TABLE [dbo].[appeal_notes]  WITH CHECK ADD  CONSTRAINT [appeal_notes_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[appeal_notes] CHECK CONSTRAINT [appeal_notes_client_id]
GO
ALTER TABLE [dbo].[appeal_reference_numbers]  WITH CHECK ADD  CONSTRAINT [appeal_reference_numbers_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[appeal_reference_numbers] CHECK CONSTRAINT [appeal_reference_numbers_client_id]
GO
ALTER TABLE [dbo].[appeal_utc_reasons]  WITH CHECK ADD  CONSTRAINT [appeal_utc_reasons_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[appeal_utc_reasons] CHECK CONSTRAINT [appeal_utc_reasons_client_id]
GO
ALTER TABLE [dbo].[appeals]  WITH CHECK ADD  CONSTRAINT [appeals_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[appeals] CHECK CONSTRAINT [appeals_client_id]
GO
ALTER TABLE [dbo].[case_activity]  WITH CHECK ADD  CONSTRAINT [case_activity_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[case_activity] CHECK CONSTRAINT [case_activity_client_id]
GO
ALTER TABLE [dbo].[case_denial_reasons]  WITH CHECK ADD  CONSTRAINT [case_denial_reasons_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[case_denial_reasons] CHECK CONSTRAINT [case_denial_reasons_client_id]
GO
ALTER TABLE [dbo].[case_readmissions]  WITH CHECK ADD  CONSTRAINT [case_readmissions_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[case_readmissions] CHECK CONSTRAINT [case_readmissions_client_id]
GO
ALTER TABLE [dbo].[cases_disciplines]  WITH CHECK ADD  CONSTRAINT [cases_disciplines_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[cases_disciplines] CHECK CONSTRAINT [cases_disciplines_client_id]
GO
ALTER TABLE [dbo].[client_employees]  WITH CHECK ADD  CONSTRAINT [client_employees_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[client_employees] CHECK CONSTRAINT [client_employees_client_id]
GO
ALTER TABLE [dbo].[denial_reasons]  WITH CHECK ADD  CONSTRAINT [denial_reasons_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[denial_reasons] CHECK CONSTRAINT [denial_reasons_client_id]
GO
ALTER TABLE [dbo].[incoming_documents]  WITH CHECK ADD  CONSTRAINT [incoming_documents_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[incoming_documents] CHECK CONSTRAINT [incoming_documents_client_id]
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels]  WITH CHECK ADD  CONSTRAINT [insurance_provider_appeal_levels_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[insurance_provider_appeal_levels] CHECK CONSTRAINT [insurance_provider_appeal_levels_client_id]
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types]  WITH CHECK ADD  CONSTRAINT [insurance_provider_insurance_types_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[insurance_provider_insurance_types] CHECK CONSTRAINT [insurance_provider_insurance_types_client_id]
GO
ALTER TABLE [dbo].[insurance_providers]  WITH CHECK ADD  CONSTRAINT [insurance_providers_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[insurance_providers] CHECK CONSTRAINT [insurance_providers_client_id]
GO
ALTER TABLE [dbo].[outgoing_documents]  WITH CHECK ADD  CONSTRAINT [outgoing_documents_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[outgoing_documents] CHECK CONSTRAINT [outgoing_documents_client_id]
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD  CONSTRAINT [patients_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[patients] CHECK CONSTRAINT [patients_client_id]
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD  CONSTRAINT [roles_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[roles] CHECK CONSTRAINT [roles_client_id]
GO
ALTER TABLE [dbo].[roles_permissions]  WITH CHECK ADD  CONSTRAINT [roles_permissions_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[roles_permissions] CHECK CONSTRAINT [roles_permissions_client_id]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_client_id]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [users_roles_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [users_roles_client_id]
GO
ALTER TABLE [dbo].[utc_reasons]  WITH CHECK ADD  CONSTRAINT [utc_reasons_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[utc_reasons] CHECK CONSTRAINT [utc_reasons_client_id]
GO
USE [master]
GO
ALTER DATABASE [revkeep] SET  READ_WRITE 
GO
