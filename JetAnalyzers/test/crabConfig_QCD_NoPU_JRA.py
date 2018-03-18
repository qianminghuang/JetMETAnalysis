from WMCore.Configuration import Configuration

config = Configuration()

config.section_("General")
config.General.requestName   = 'QCD_NoPU_JRA'
config.General.transferLogs = True

config.section_("JobType")
config.JobType.pluginName  = 'Analysis'
# Name of the CMSSW configuration file
config.JobType.psetName    = 'run_JRA_hlt_cfg.py'
config.JobType.inputFiles    = ['PFCalibration_HLT_2018_25ns_Spring18_V2.db']
config.JobType.allowUndistributedCMSSW = True

config.section_("Data")
# This string determines the primary dataset of the newly-produced outputs.
# For instance, this dataset will be named /CrabTestSingleMu/something/USER
config.Data.inputDBS = 'phys03'
#config.Data.inputDataset = '/QCD_Pt-15to3000_TuneCP5_Flat_13TeV_pythia8/mdjordje-QCD_NoPU_1003_JEC_X-358428f685c21c992759bf099478a828/USER'
config.Data.inputDataset = '/QCD_Pt-15to3000_TuneCP5_Flat_13TeV_pythia8/qihuang-prentuple_QCD_NoPU-358428f685c21c992759bf099478a828/USER'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 13
#config.Data.totalUnits = 10
config.Data.outLFNDirBase = '/store/group/phys_jetmet/qihuang/10_0_3/JRA/nopu'
#config.Data.useParent = True 
#config.Data.lumiMask = '/afs/cern.ch/user/m/mdjordje/public/2017JSON/Cert_13TeV_2017_HCAL_DCS_GOOD.txt'
config.JobType.maxMemoryMB = 4000

# This string is used to construct the output dataset name
#config.Data.publishDataName = 'CRAB3-tutorial'

#config.Data.publication = True
#config.Data.publishDBS = 'phys03'
#config.Data.outputDatasetTag = 'QCD_NoPU_JRA'

config.section_("Site")
# Where the output files will be transmitted to
config.Site.storageSite = 'T2_CH_CERN'
#config.Site.whitelist = ["T2_CH_CERN"]
