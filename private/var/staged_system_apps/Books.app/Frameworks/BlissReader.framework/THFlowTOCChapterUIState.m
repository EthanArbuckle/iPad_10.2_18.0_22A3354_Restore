@implementation THFlowTOCChapterUIState

- (THFlowTOCChapterUIState)initWithSection:(id)a3
{
  THFlowTOCChapterUIState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCChapterUIState;
  v4 = -[THFlowTOCChapterUIState init](&v6, "init");
  if (v4)
  {
    v4->mSection = (NSIndexPath *)a3;
    v4->mOpened = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mSection = 0;
  self->mSubItems = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCChapterUIState;
  -[THFlowTOCChapterUIState dealloc](&v3, "dealloc");
}

- (NSIndexPath)section
{
  return self->mSection;
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)opened
{
  return self->mOpened;
}

- (void)setOpened:(BOOL)a3
{
  self->mOpened = a3;
}

- (NSMutableArray)subItems
{
  return self->mSubItems;
}

- (void)setSubItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
