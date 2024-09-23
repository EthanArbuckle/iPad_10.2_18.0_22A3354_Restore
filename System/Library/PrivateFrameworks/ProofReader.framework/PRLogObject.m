@implementation PRLogObject

os_log_t __PRLogObject_block_invoke()
{
  os_log_t result;

  __PRLogGeneral = (uint64_t)os_log_create("com.apple.ProofReader", "general");
  __PRLogCorrection = (uint64_t)os_log_create("com.apple.ProofReader", "correction");
  __PRLogGuessing = (uint64_t)os_log_create("com.apple.ProofReader", "guessing");
  __PRLogCompletion = (uint64_t)os_log_create("com.apple.ProofReader", "completion");
  __PRLogAdaptation = (uint64_t)os_log_create("com.apple.ProofReader", "adaptation");
  __PRLogAssets = (uint64_t)os_log_create("com.apple.ProofReader", "assets");
  __PRLogTimes = (uint64_t)os_log_create("com.apple.ProofReader", "times");
  __PRLogNames = (uint64_t)os_log_create("com.apple.ProofReader", "names");
  __PRLogXPC = (uint64_t)os_log_create("com.apple.ProofReader", "xpc");
  __PRLogLexicon = (uint64_t)os_log_create("com.apple.ProofReader", "lexicon");
  __PRLogLanguageModel = (uint64_t)os_log_create("com.apple.ProofReader", "language-model");
  __PRLogTypology = (uint64_t)os_log_create("com.apple.ProofReader", "typology");
  __PRLogReplacements = (uint64_t)os_log_create("com.apple.ProofReader", "replacements");
  __PRLogAssetRequests = (uint64_t)os_log_create("com.apple.ProofReader", "asset-requests");
  __PRLogBackground = (uint64_t)os_log_create("com.apple.ProofReader", "background");
  __PRLogSentenceCorrection = (uint64_t)os_log_create("com.apple.ProofReader", "sentence-correction");
  __PRLogInputAnalytics = (uint64_t)os_log_create("com.apple.ProofReader", "input-analytics");
  result = os_log_create("com.apple.ProofReader", "container");
  __PRLogContainer = (uint64_t)result;
  return result;
}

@end
