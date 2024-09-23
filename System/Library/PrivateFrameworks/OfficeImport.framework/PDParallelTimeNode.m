@implementation PDParallelTimeNode

- (PDParallelTimeNodeBuildInfo)buildInfo
{
  return (PDParallelTimeNodeBuildInfo *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBuildInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBuildInfo, 0);
}

@end
