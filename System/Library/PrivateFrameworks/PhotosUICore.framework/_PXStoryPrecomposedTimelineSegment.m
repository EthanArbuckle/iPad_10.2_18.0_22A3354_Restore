@implementation _PXStoryPrecomposedTimelineSegment

- (_PXStoryPrecomposedTimelineSegment)initWithClipComposition:(id)a3 transitionKind:(char)a4
{
  id v7;
  _PXStoryPrecomposedTimelineSegment *v8;
  _PXStoryPrecomposedTimelineSegment *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PXStoryPrecomposedTimelineSegment;
  v8 = -[_PXStoryPrecomposedTimelineSegment init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clipComposition, a3);
    v9->_transitionKind = a4;
  }

  return v9;
}

- (PXStoryClipComposition)clipComposition
{
  return self->_clipComposition;
}

- (void)setClipComposition:(id)a3
{
  objc_storeStrong((id *)&self->_clipComposition, a3);
}

- (char)transitionKind
{
  return self->_transitionKind;
}

- (void)setTransitionKind:(char)a3
{
  self->_transitionKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipComposition, 0);
}

@end
