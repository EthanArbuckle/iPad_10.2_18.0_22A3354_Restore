@implementation ExclaveStackEntry

- (void)addFrames:(id)a3
{
  id v4;
  NSMutableArray *frames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  frames = self->_frames;
  v8 = v4;
  if (!frames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_frames;
    self->_frames = v6;

    v4 = v8;
    frames = self->_frames;
  }
  -[NSMutableArray addObject:](frames, "addObject:", v4);

}

- (NSNumber)addressSpaceId
{
  return self->_addressSpaceId;
}

- (void)setAddressSpaceId:(id)a3
{
  objc_storeStrong((id *)&self->_addressSpaceId, a3);
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_addressSpaceId, 0);
}

@end
