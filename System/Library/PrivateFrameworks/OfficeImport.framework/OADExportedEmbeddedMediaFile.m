@implementation OADExportedEmbeddedMediaFile

- (BOOL)isAudioOnly
{
  return *(&self->super.super.loop + 1);
}

- (void)setIsAudioOnly:(BOOL)a3
{
  *(&self->super.super.loop + 1) = a3;
}

- (TSPData)tspData
{
  return *(TSPData **)&self->isAudioOnly;
}

- (void)setTspData:(id)a3
{
  objc_storeStrong((id *)&self->isAudioOnly, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->isAudioOnly, 0);
}

@end
