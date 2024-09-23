@implementation TSDConnectionLineInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineInfo;
  -[TSDShapeInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineInfo;
  v3 = -[TSDShapeInfo copyWithContext:](&v6, sel_copyWithContext_, a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setConnectedFrom:", 0);
    objc_msgSend(v4, "setConnectedTo:", 0);
  }
  return v4;
}

- (Class)layoutClass
{
  void *v3;
  uint64_t v4;

  objc_opt_class();
  -[TSDShapeInfo pathSource](self, "pathSource");
  if (objc_msgSend((id)TSUDynamicCast(), "type") > 1)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineInfo layoutClass]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 77, CFSTR("Wrong connection line path source type."));
  }
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)presetKind
{
  return String;
}

- (void)setConnectedTo:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 == self)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineInfo setConnectedTo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 103, CFSTR("attempting to connect a line to itself!"));
  }
  if (self->mConnectedTo != a3)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 539);

    self->mConnectedTo = (TSDDrawableInfo *)a3;
  }
}

- (void)setConnectedFrom:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 == self)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineInfo setConnectedFrom:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 114, CFSTR("attempting to connect a line from itself!"));
  }
  if (self->mConnectedFrom != a3)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 540);

    self->mConnectedFrom = (TSDDrawableInfo *)a3;
  }
}

- (id)computeLayoutInfoGeometry
{
  void *v3;

  v3 = 0;
  -[TSDConnectionLineInfo computeLayoutInfoGeometry:andPathSource:](self, "computeLayoutInfoGeometry:andPathSource:", &v3, 0);
  return v3;
}

- (void)computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4
{
  void *v7;
  void *v8;
  _QWORD v9[7];

  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
  v8 = v7;
  if (self->mConnectedFrom)
    objc_msgSend(v7, "addObject:");
  if (self->mConnectedTo)
    objc_msgSend(v8, "addObject:");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__TSDConnectionLineInfo_computeLayoutInfoGeometry_andPathSource___block_invoke;
  v9[3] = &unk_24D82C8E0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  +[TSDLayoutController temporaryLayoutControllerForInfos:useInBlock:](TSDLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v8, v9);
}

uint64_t __65__TSDConnectionLineInfo_computeLayoutInfoGeometry_andPathSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(a2, "layoutForInfo:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(v3, "invalidateConnections");
  if (*(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend(v3, "layoutInfoGeometry");
    **(_QWORD **)(a1 + 40) = result;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    result = objc_msgSend(v3, "pathSource");
    **(_QWORD **)(a1 + 48) = result;
  }
  return result;
}

- (CGAffineTransform)computeLayoutFullTransform
{
  CGAffineTransform *result;

  result = -[TSDConnectionLineInfo computeLayoutInfoGeometry](self, "computeLayoutInfoGeometry");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform fullTransform](result, "fullTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (BOOL)canAnchor
{
  return 0;
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(v6, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(v6, "objectAtIndex:", v4);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v5, "childInfos"));
      ++v4;
    }
    while (v4 < objc_msgSend(v6, "count"));
  }
  if ((objc_msgSend(v6, "containsObject:", self->mConnectedFrom) & 1) == 0)
    *(_BYTE *)&self->mInvalidFlags |= 1u;
  if ((objc_msgSend(v6, "containsObject:", self->mConnectedTo) & 1) == 0)
    *(_BYTE *)&self->mInvalidFlags |= 2u;

}

- (void)didCopy
{
  *(_BYTE *)&self->mInvalidFlags &= 0xFCu;
}

- (void)performBlockWithTemporaryLayout:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
  v6 = v5;
  if (self->mConnectedFrom)
    objc_msgSend(v5, "addObject:");
  if (self->mConnectedTo)
    objc_msgSend(v6, "addObject:");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__TSDConnectionLineInfo_performBlockWithTemporaryLayout___block_invoke;
  v7[3] = &unk_24D82B5F0;
  v7[4] = self;
  v7[5] = a3;
  +[TSDLayoutController temporaryLayoutControllerForInfos:useInBlock:](TSDLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v6, v7);
}

uint64_t __57__TSDConnectionLineInfo_performBlockWithTemporaryLayout___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(a2, "layoutForInfo:", *(_QWORD *)(a1 + 32)));
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSDConnectionLineInfo:", self);
}

- (TSDDrawableInfo)connectedFrom
{
  return self->mConnectedFrom;
}

- (TSDDrawableInfo)connectedTo
{
  return self->mConnectedTo;
}

@end
