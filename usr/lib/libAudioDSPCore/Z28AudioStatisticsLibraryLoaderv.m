@implementation Z28AudioStatisticsLibraryLoaderv

void *___Z28AudioStatisticsLibraryLoaderv_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/libAudioStatistics.dylib", 1);
  if (result)
  {
    v1 = result;
    AudioStatisticsLibraryLoader(void)::libSym = (uint64_t)dlsym(result, "CreateSharedCAReportingClient");
    qword_254A6DF18 = (uint64_t)dlsym(v1, "CAReportingClientCreateReporterID");
    qword_254A6DF20 = (uint64_t)dlsym(v1, "CAReportingClientCreateReporterIDFromSessionID");
    qword_254A6DF28 = (uint64_t)dlsym(v1, "CAReportingClientCreatePerformanceReporterID");
    qword_254A6DF30 = (uint64_t)dlsym(v1, "CAReportingClientStartReporter");
    qword_254A6DF38 = (uint64_t)dlsym(v1, "CAReportingClientStopReporter");
    qword_254A6DF40 = (uint64_t)dlsym(v1, "CAReportingClientSetAudioServiceType");
    qword_254A6DF48 = (uint64_t)dlsym(v1, "CAReportingClientGetAudioServiceType");
    qword_254A6DF50 = (uint64_t)dlsym(v1, "CAReportingClientSetConfiguration");
    qword_254A6DF58 = (uint64_t)dlsym(v1, "CAReportingClientCopyConfiguration");
    qword_254A6DF60 = (uint64_t)dlsym(v1, "CAReportingClientSendMessage");
    off_254A6DF68 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v1, "CAReportingClientSendSingleMessage");
    qword_254A6DF70 = (uint64_t)dlsym(v1, "CAReportingClientDestroyReporterID");
    result = dlsym(v1, "CAReportingClientRequestMessage");
    qword_254A6DF78 = (uint64_t)result;
  }
  return result;
}

@end
