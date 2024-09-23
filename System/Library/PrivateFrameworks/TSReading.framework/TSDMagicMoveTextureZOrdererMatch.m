@implementation TSDMagicMoveTextureZOrdererMatch

- (TSDMagicMoveTextureZOrdererMatch)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrdererMatch init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 994, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSDMagicMoveTextureZOrdererMatch init]"), 0));
}

- (TSDMagicMoveTextureZOrdererMatch)initWithAnimationMatch:(id)a3
{
  TSDMagicMoveTextureZOrdererMatch *v4;
  TSDMagicMoveTextureZOrdererMatch *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t incomingZIndex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  v4 = -[TSDMagicMoveTextureZOrdererMatch init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_outgoingZIndex = -1;
    v4->_incomingZIndex = -1;
    v6 = objc_msgSend(a3, "outgoingTexture");
    v7 = objc_msgSend(a3, "incomingTexture");
    if (v6 | v7)
    {
      v5->_animationMatch = (TSDMagicMoveAnimationMatch *)a3;
      if (v6)
      {
        v5->_outgoingTexture = (TSDTextureSet *)v6;
        v5->_outgoingZIndex = objc_msgSend((id)v6, "textureZOrder");
      }
      if (v7)
      {
        v5->_incomingTexture = (TSDTextureSet *)v7;
        v5->_incomingZIndex = objc_msgSend((id)v7, "textureZOrder");
        if (!v6)
          goto LABEL_10;
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrdererMatch initWithAnimationMatch:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1005, CFSTR("incomingTexture and outgoingTexture are both nil!"));
      v5->_animationMatch = (TSDMagicMoveAnimationMatch *)a3;
    }
    v5->_incomingTexture = (TSDTextureSet *)v6;
    if (!v6)
LABEL_10:
      v5->_outgoingTexture = (TSDTextureSet *)v7;
LABEL_11:
    incomingZIndex = v5->_incomingZIndex;
    v5->_isOutgoingZIndexUnmatched = v5->_outgoingZIndex == -1;
    v5->_isIncomingZIndexUnmatched = incomingZIndex == -1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  -[TSDMagicMoveTextureZOrdererMatch dealloc](&v3, sel_dealloc);
}

- (BOOL)intersectsZOrdererMatch:(id)a3 withAttemptedZIndex:(int64_t)a4
{
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  if (objc_msgSend(a3, "outgoingZIndex") == -1 || objc_msgSend(a3, "incomingZIndex") == -1)
    return 0;
  v7 = -[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex");
  v8 = 2 * a4 - 1;
  if (v7 >= 0)
    v9 = 2 * v7;
  else
    v9 = v8;
  v10 = -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex");
  if (v10 >= 0)
    v8 = 2 * v10;
  v11 = objc_msgSend(a3, "outgoingZIndex");
  v12 = objc_msgSend(a3, "incomingZIndex");
  v13 = v8 > 2 * v12;
  if (v8 < 2 * v12)
    v13 = -1;
  v14 = v9 > 2 * v11;
  if (v9 < 2 * v11)
    v14 = -1;
  v15 = v14 != v13 && v9 != 2 * v11;
  return v8 != 2 * v12 && v15;
}

- (BOOL)intersectsZOrdererMatch:(id)a3
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (-[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex") == -1
    || -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex") == -1
    || objc_msgSend(a3, "outgoingZIndex") == -1
    || objc_msgSend(a3, "incomingZIndex") == -1)
  {
    return 0;
  }
  v5 = -[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex");
  v6 = objc_msgSend(a3, "outgoingZIndex");
  if (v5 < v6)
    v7 = -1;
  else
    v7 = v5 > v6;
  v8 = -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex");
  v9 = objc_msgSend(a3, "incomingZIndex");
  v10 = v8 > v9;
  if (v8 < v9)
    v10 = -1;
  return v7 != v10;
}

- (double)intersectionPercentWithZOrdererMatch:(id)a3
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = -[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex");
  v6 = objc_msgSend(a3, "outgoingZIndex");
  if (v5 - v6 >= 0)
    v7 = v5 - v6;
  else
    v7 = v6 - v5;
  v8 = -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex");
  v9 = objc_msgSend(a3, "incomingZIndex");
  v10 = v8 - v9;
  if (v8 - v9 < 0)
    v10 = v9 - v8;
  return (double)v7 / (double)(v10 + v7);
}

- (double)interpolatedZIndexAtPercent:(double)a3
{
  double result;

  TSUMix();
  return result;
}

- (id)description
{
  TSDTextureSet *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDMagicMoveTextureZOrdererMatch outgoingTexture](self, "outgoingTexture");
  if (!v3)
    v3 = -[TSDMagicMoveTextureZOrdererMatch incomingTexture](self, "incomingTexture");
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[TSDTextureSet visibleTextures](v3, "visibleTextures");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", TSDStringFromTextureType(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "textureType")));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v10 = objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));

  v12.receiver = self;
  v12.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %d->%d (%@)"), -[TSDMagicMoveTextureZOrdererMatch description](&v12, sel_description), -[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex"), -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex"), v10);
}

- (TSDTextureSet)outgoingTexture
{
  return self->_outgoingTexture;
}

- (TSDTextureSet)incomingTexture
{
  return self->_incomingTexture;
}

- (int64_t)outgoingZIndex
{
  return self->_outgoingZIndex;
}

- (void)setOutgoingZIndex:(int64_t)a3
{
  self->_outgoingZIndex = a3;
}

- (int64_t)incomingZIndex
{
  return self->_incomingZIndex;
}

- (void)setIncomingZIndex:(int64_t)a3
{
  self->_incomingZIndex = a3;
}

- (BOOL)isOutgoingZIndexUnmatched
{
  return self->_isOutgoingZIndexUnmatched;
}

- (BOOL)isIncomingZIndexUnmatched
{
  return self->_isIncomingZIndexUnmatched;
}

- (TSDMagicMoveAnimationMatch)animationMatch
{
  return self->_animationMatch;
}

@end
