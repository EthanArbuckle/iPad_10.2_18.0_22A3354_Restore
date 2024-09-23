@implementation PXAppleMusicCurationInfo

- (PXAppleMusicCurationInfo)init
{
  return -[PXAppleMusicCurationInfo initWithPerformerNames:](self, "initWithPerformerNames:", MEMORY[0x1E0C9AA60]);
}

- (PXAppleMusicCurationInfo)initWithPerformerNames:(id)a3
{
  id v4;
  PXAppleMusicCurationInfo *v5;
  uint64_t v6;
  NSArray *performerNames;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicCurationInfo;
  v5 = -[PXAppleMusicCurationInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    performerNames = v5->_performerNames;
    v5->_performerNames = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)performerNames
{
  return self->_performerNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerNames, 0);
}

@end
