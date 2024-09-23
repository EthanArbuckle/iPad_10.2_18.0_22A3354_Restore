@implementation VMURuntimeMetadataChunkInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->owningClassInfo, 0);
}

@end
