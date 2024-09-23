@implementation FusionBuffers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ltmChromaTex, 0);
  objc_storeStrong((id *)&self->ltmLumaTex, 0);
  objc_storeStrong((id *)&self->scratchBuffer, 0);
}

@end
