@implementation _PXStoryScrollPositionReference

- (_PXStoryScrollPositionReference)init
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  return -[_PXStoryScrollPositionReference initWithScrollPosition:](self, "initWithScrollPosition:", v3);
}

- (_PXStoryScrollPositionReference)initWithScrollPosition:(id *)a3
{
  _PXStoryScrollPositionReference *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXStoryScrollPositionReference;
  result = -[_PXStoryScrollPositionReference init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    result->_scrollPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&result->_scrollPosition.firstSegmentIdentifier = v5;
  }
  return result;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- ($7DA682ECC7253F641496E0B6E9C98204)scrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)&self->var2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
