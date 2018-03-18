from WMCore.Configuration import Configuration

config = Configuration()

config.section_("General")
config.General.requestName   = 'QCD_NoPU'
config.General.transferLogs = True

config.section_("JobType")
config.JobType.pluginName  = 'Analysis'
# Name of the CMSSW configuration file
config.JobType.psetName    = 'dump_hlt_10_0_3_JEC.py'
config.JobType.inputFiles    = ['PFCalibration_HLT_2018_25ns_Spring18_V2.db']
config.JobType.allowUndistributedCMSSW = True

config.section_("Data")
# This string determines the primary dataset of the newly-produced outputs.
# For instance, this dataset will be named /CrabTestSingleMu/something/USER
config.Data.inputDataset = '/QCD_Pt-15to3000_TuneCP5_Flat_13TeV_pythia8/RunIISpring18DR-NZSNoPU_100X_upgrade2018_realistic_v10-v1/GEN-SIM-RAW'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
#config.Data.totalUnits = 5
config.Data.outLFNDirBase = '/store/group/phys_jetmet/qihuang/10_0_3/prentuple'
#config.Data.useParent = True 
#config.Data.lumiMask = '/afs/cern.ch/user/m/mdjordje/public/2017JSON/Cert_13TeV_2017_HCAL_DCS_GOOD.txt'
config.JobType.maxMemoryMB = 4000

# This string is used to construct the output dataset name
#config.Data.publishDataName = 'CRAB3-tutorial'

config.Data.publication = True
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'QCD_NoPU'

config.section_("Site")
# Where the output files will be transmitted to
config.Site.storageSite = 'T2_CH_CERN'
#config.Site.whitelist = ["T2_CH_CERN"]
