@implementation PXStoryHitTestResult

- (PXStoryHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  PXStoryHitTestResult *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "spriteReferenceForSpriteIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXStoryHitTestResult;
  v11 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](&v13, sel_initWithSpriteReference_layout_identifier_userData_, v10, v9, v8, 0);

  v11->_clipIdentifier = 0;
  return v11;
}

- (id)clipIdentifier:(int64_t)a3
{
  *((_QWORD *)self + 16) = a3;
  return self;
}

- (int64_t)clipIdentifier
{
  return self->_clipIdentifier;
}

@end
