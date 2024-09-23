@implementation TSDMagicMoveAnimationMatch

+ (unint64_t)magicMoveMorphTexturesPerSecond
{
  return 15;
}

- (TSDMagicMoveAnimationMatch)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 392, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSDMagicMoveAnimationMatch init]"), 0));
}

- (TSDMagicMoveAnimationMatch)initWithMatchType:(int64_t)a3 outgoingTexture:(id)a4 incomingTexture:(id)a5
{
  TSDMagicMoveAnimationMatch *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDMagicMoveAnimationMatch;
  v8 = -[TSDMagicMoveAnimationMatch init](&v10, sel_init);
  if (v8)
  {
    v8->_morphTextureUpdateLock = (NSLock *)objc_opt_new();
    -[TSDMagicMoveAnimationMatch setMatchType:](v8, "setMatchType:", a3);
    -[TSDMagicMoveAnimationMatch setOutgoingTexture:](v8, "setOutgoingTexture:", a4);
    -[TSDMagicMoveAnimationMatch setIncomingTexture:](v8, "setIncomingTexture:", a5);
  }
  return v8;
}

- (void)dealloc
{
  TSDTextureSet *incomingTexture;
  void *v4;
  uint64_t v5;
  TSDTextureSet *outgoingTexture;
  void *v7;
  uint64_t v8;
  objc_super v9;

  if (!self->_hasBeenTornDown)
    -[TSDMagicMoveAnimationMatch teardown](self, "teardown");

  incomingTexture = self->_incomingTexture;
  if (incomingTexture)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch dealloc]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 416, CFSTR("expected nil value for '%s'"), "_incomingTexture");
    incomingTexture = self->_incomingTexture;
  }

  outgoingTexture = self->_outgoingTexture;
  if (outgoingTexture)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch dealloc]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 418, CFSTR("expected nil value for '%s'"), "_outgoingTexture");
    outgoingTexture = self->_outgoingTexture;
  }

  v9.receiver = self;
  v9.super_class = (Class)TSDMagicMoveAnimationMatch;
  -[TSDMagicMoveAnimationMatch dealloc](&v9, sel_dealloc);
}

- (void)teardown
{
  if (!self->_hasBeenTornDown)
  {
    if (self->_isMorphMatch || -[TSDMagicMoveAnimationMatch shouldTearDownTextures](self, "shouldTearDownTextures"))
    {
      -[TSDTextureSet releaseSingleTextures](self->_outgoingTexture, "releaseSingleTextures");
      -[TSDTextureSet teardown](self->_outgoingTexture, "teardown");

      self->_outgoingTexture = 0;
      -[TSDTextureSet releaseSingleTextures](self->_incomingTexture, "releaseSingleTextures");
      -[TSDTextureSet teardown](self->_incomingTexture, "teardown");
    }
    else
    {

      self->_outgoingTexture = 0;
    }

    self->_incomingTexture = 0;
    -[TSDTextureSet releaseSingleTextures](self->_morphTexture, "releaseSingleTextures");
    -[TSDTextureSet teardown](self->_morphTexture, "teardown");

    self->_morphTexture = 0;
    -[TSDTextureSet releaseSingleTextures](self->_morphQueuedTexture, "releaseSingleTextures");
    -[TSDTextureSet teardown](self->_morphQueuedTexture, "teardown");

    self->_morphQueuedTexture = 0;
    -[TSDTextureSet releaseSingleTextures](self->_morphQueuedForDeletionTexture, "releaseSingleTextures");
    -[TSDTextureSet teardown](self->_morphQueuedForDeletionTexture, "teardown");

    self->_morphQueuedForDeletionTexture = 0;
    self->_hasBeenTornDown = 1;
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (-[TSDMagicMoveAnimationMatch isMorphMatch](self, "isMorphMatch"))
    objc_msgSend(v3, "addObject:", CFSTR("isMorphMatch"));
  if (-[TSDMagicMoveAnimationMatch isMatched](self, "isMatched"))
    objc_msgSend(v3, "addObject:", CFSTR("isMatched"));
  if (-[TSDMagicMoveAnimationMatch incomingTexture](self, "incomingTexture"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("incoming:%@"), -[TSDMagicMoveAnimationMatch incomingTexture](self, "incomingTexture")));
  if (-[TSDMagicMoveAnimationMatch outgoingTexture](self, "outgoingTexture"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("outgoing:%@"), -[TSDMagicMoveAnimationMatch outgoingTexture](self, "outgoingTexture")));
  v4 = objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v6.receiver = self;
  v6.super_class = (Class)TSDMagicMoveAnimationMatch;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: {%@}"), -[TSDMagicMoveAnimationMatch description](&v6, sel_description), v4);
}

- (BOOL)isMatched
{
  TSDTextureSet *v3;

  v3 = -[TSDMagicMoveAnimationMatch incomingTexture](self, "incomingTexture");
  if (v3)
    LOBYTE(v3) = -[TSDMagicMoveAnimationMatch outgoingTexture](self, "outgoingTexture") != 0;
  return (char)v3;
}

- (void)addMorphTexture:(id)a3
{
  NSLock *morphTextureUpdateLock;
  TSDTextureSet *morphTexture;
  TSDTextureSet *morphQueuedTexture;

  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  morphQueuedTexture = self->_morphQueuedTexture;
  if (*(_WORD *)&self->_isUsingMorphTexture)
  {
    morphTexture = 0;
    self->_morphQueuedTexture = (TSDTextureSet *)a3;
  }
  else
  {
    morphTexture = self->_morphTexture;
    self->_morphTexture = (TSDTextureSet *)a3;
    self->_didUseMorphTexture = 0;
  }
  objc_sync_exit(morphTextureUpdateLock);
  -[TSDTextureSet releaseSingleTextures](morphTexture, "releaseSingleTextures");
  -[TSDTextureSet teardown](morphTexture, "teardown");

  -[TSDTextureSet releaseSingleTextures](morphQueuedTexture, "releaseSingleTextures");
  -[TSDTextureSet teardown](morphQueuedTexture, "teardown");

}

- (void)clearMorphTexture
{
  NSLock *morphTextureUpdateLock;
  TSDTextureSet *morphTexture;
  TSDTextureSet *morphQueuedTexture;

  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  morphTexture = self->_morphTexture;
  morphQueuedTexture = self->_morphQueuedTexture;
  *(_WORD *)&self->_isUsingMorphTexture = 0;
  self->_morphTexture = 0;
  self->_morphQueuedTexture = 0;
  objc_sync_exit(morphTextureUpdateLock);
  -[TSDTextureSet releaseSingleTextures](morphTexture, "releaseSingleTextures");
  -[TSDTextureSet teardown](morphTexture, "teardown");

  -[TSDTextureSet releaseSingleTextures](morphQueuedTexture, "releaseSingleTextures");
  -[TSDTextureSet teardown](morphQueuedTexture, "teardown");

}

- (id)lockCurrentMorphTexture
{
  void *v3;
  uint64_t v4;
  NSLock *morphTextureUpdateLock;
  void *v6;
  uint64_t v7;
  TSDTextureSet *morphQueuedTexture;
  TSDTextureSet *morphTexture;

  if (!-[TSDMagicMoveAnimationMatch isMorphMatch](self, "isMorphMatch"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch lockCurrentMorphTexture]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 522, CFSTR("Not a morph animation!"));
  }
  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  if (self->_isUsingMorphTexture)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch lockCurrentMorphTexture]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 529, CFSTR("Morph texture is already locked!"));
    morphQueuedTexture = 0;
  }
  else
  {
    if (self->_morphQueuedForDeletionTexture)
      self->_morphQueuedForDeletionTexture = 0;
    morphTexture = self->_morphTexture;
    morphQueuedTexture = self->_morphQueuedTexture;
    if (morphQueuedTexture)
    {
      self->_morphQueuedTexture = 0;
      self->_morphQueuedForDeletionTexture = morphTexture;
      morphTexture = morphQueuedTexture;
      self->_morphTexture = morphQueuedTexture;
    }
    else
    {
      morphQueuedTexture = self->_morphTexture;
      if (!morphTexture)
        morphQueuedTexture = self->_outgoingTexture;
    }
    self->_isUsingMorphTexture = 1;
    self->_didUseMorphTexture = morphTexture != 0;
  }
  objc_sync_exit(morphTextureUpdateLock);
  return morphQueuedTexture;
}

- (void)unlockCurrentMorphTexture
{
  NSLock *morphTextureUpdateLock;
  void *v4;
  uint64_t v5;

  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  if (!self->_isUsingMorphTexture)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveAnimationMatch unlockCurrentMorphTexture]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 554, CFSTR("Tried to unlock morph texture when not locked!"));
  }
  self->_isUsingMorphTexture = 0;
  objc_sync_exit(morphTextureUpdateLock);
}

- (TSDTextureSet)outgoingTexture
{
  return self->_outgoingTexture;
}

- (void)setOutgoingTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSDTextureSet)incomingTexture
{
  return self->_incomingTexture;
}

- (void)setIncomingTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)isMorphMatch
{
  return self->_isMorphMatch;
}

- (void)setIsMorphMatch:(BOOL)a3
{
  self->_isMorphMatch = a3;
}

- (BOOL)isTextStyleIdenticalExceptSize
{
  return self->_isTextStyleIdenticalExceptSize;
}

- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3
{
  self->_isTextStyleIdenticalExceptSize = a3;
}

- (BOOL)shouldDisableTextMorphing
{
  return self->_shouldDisableTextMorphing;
}

- (void)setShouldDisableTextMorphing:(BOOL)a3
{
  self->_shouldDisableTextMorphing = a3;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (NSDictionary)outgoingTextureActionBuildFinalAttributes
{
  return self->_outgoingTextureActionBuildFinalAttributes;
}

- (void)setOutgoingTextureActionBuildFinalAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)shouldTearDownTextures
{
  return self->_shouldTearDownTextures;
}

- (void)setShouldTearDownTextures:(BOOL)a3
{
  self->_shouldTearDownTextures = a3;
}

@end
