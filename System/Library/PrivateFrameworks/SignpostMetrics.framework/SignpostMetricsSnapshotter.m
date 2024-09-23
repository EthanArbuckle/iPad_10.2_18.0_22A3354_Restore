@implementation SignpostMetricsSnapshotter

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v5;

  v5 = a3;
  if (encodeWithOSLogCoder_options_maxLength__onceToken != -1)
    dispatch_once(&encodeWithOSLogCoder_options_maxLength__onceToken, &__block_literal_global);
  if (encodeWithOSLogCoder_options_maxLength__session)
    pc_session_create_snapshot_buf();
  objc_msgSend(v5, "appendBytes:length:", 0, 0);

}

uint64_t __69__SignpostMetricsSnapshotter_encodeWithOSLogCoder_options_maxLength___block_invoke()
{
  encodeWithOSLogCoder_options_maxLength__session = pc_session_create();
  getpid();
  return pc_session_set_procpid();
}

@end
