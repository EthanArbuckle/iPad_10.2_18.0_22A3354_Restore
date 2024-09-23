@implementation TSDMagicMoveMatch

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
  -[TSDMagicMoveMatch p_updateMagicMoveCost](self, "p_updateMagicMoveCost");
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
  -[TSDMagicMoveMatch p_updateMagicMoveCost](self, "p_updateMagicMoveCost");
}

- (void)setZOrderDistance:(double)a3
{
  self->_zOrderDistance = a3;
  -[TSDMagicMoveMatch p_updateMagicMoveCost](self, "p_updateMagicMoveCost");
}

- (void)setAttributeMatchPercent:(double)a3
{
  void *v5;
  uint64_t v6;
  double v7;

  if (a3 < 0.0 || a3 > 1.0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatch setAttributeMatchPercent:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 773, CFSTR("attributes match percent must be between 0 and 1!"));
  }
  TSUClamp();
  self->_attributeMatchPercent = v7;
  -[TSDMagicMoveMatch p_updateMagicMoveCost](self, "p_updateMagicMoveCost");
}

- (BOOL)isTextMatch
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;

  if (-[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"))
  {
    if (-[TSDMagicMoveMatch incomingObject](self, "incomingObject"))
    {
      v3 = -[TSDMagicMoveMatchObject stringValue](-[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), "stringValue") != 0;
      if (((v3 ^ (-[TSDMagicMoveMatchObject stringValue](-[TSDMagicMoveMatch incomingObject](self, "incomingObject"), "stringValue") == 0)) & 1) == 0)
      {
        v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatch isTextMatch]");
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 781, CFSTR("One of these objects is text, and the other is not!"));
      }
    }
  }
  return -[TSDMagicMoveMatchObject stringValue](-[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), "stringValue")|| -[TSDMagicMoveMatchObject stringValue](-[TSDMagicMoveMatch incomingObject](self, "incomingObject"), "stringValue") != 0;
}

+ (id)matchWithOutgoingObject:(id)a3 incomingObject:(id)a4 matchType:(int64_t)a5 attributeMatchPercent:(double)a6 textureDescription:(id)a7
{
  TSDMagicMoveMatch *v12;
  void *v13;
  uint64_t v14;

  v12 = objc_alloc_init(TSDMagicMoveMatch);
  v12->_outgoingObject = (TSDMagicMoveMatchObject *)a3;
  v12->_incomingObject = (TSDMagicMoveMatchObject *)a4;
  -[TSDMagicMoveMatch setMatchType:](v12, "setMatchType:", a5);
  -[TSDMagicMoveMatch setAttributeMatchPercent:](v12, "setAttributeMatchPercent:", a6);
  -[TSDMagicMoveMatch setTextureDescription:](v12, "setTextureDescription:", a7);
  objc_msgSend(a3, "position");
  objc_msgSend(a4, "position");
  TSUDistance();
  -[TSDMagicMoveMatch setDistance:](v12, "setDistance:");
  -[TSDMagicMoveMatch setZOrderDistance:](v12, "setZOrderDistance:", vabdd_f64((double)objc_msgSend(a3, "zOrder"), (double)objc_msgSend(a4, "zOrder")));
  if (-[TSDMagicMoveMatch matchType](v12, "matchType") == 1)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMagicMoveMatch matchWithOutgoingObject:incomingObject:matchType:attributeMatchPercent:textureDescription:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 808, CFSTR("Why are you creating a magic move match that can't exist? Get it together."));
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatch;
  -[TSDMagicMoveMatch dealloc](&v3, sel_dealloc);
}

- (void)p_updateMagicMoveCost
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = 0.0;
  switch(-[TSDMagicMoveMatch matchType](self, "matchType"))
  {
    case 0:
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatch p_updateMagicMoveCost]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 851, CFSTR("matchType is undefined!"));
      break;
    case 1:
      v3 = 600000.0;
      break;
    case 2:
      v3 = 500000.0;
      break;
    case 3:
      v3 = 400000.0;
      break;
    case 4:
      v3 = 300000.0;
      break;
    case 5:
      v3 = 200000.0;
      break;
    case 10:
      v3 = 100000.0;
      break;
    default:
      break;
  }
  -[TSDMagicMoveMatch attributeMatchPercent](self, "attributeMatchPercent");
  v7 = v3 + (2.0 - v6) * 10000.0;
  -[TSDMagicMoveMatch distance](self, "distance");
  v9 = v8 + v7;
  -[TSDMagicMoveMatch zOrderDistance](self, "zOrderDistance");
  self->_matchCost = (uint64_t)(v10 + v9);
}

- (id)description
{
  NSString *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  if (-[TSDMagicMoveMatch name](self, "name"))
  {
    v3 = -[TSDMagicMoveMatch name](self, "name");
  }
  else
  {
    v4 = 0;
    switch(-[TSDMagicMoveMatch matchType](self, "matchType"))
    {
      case 0:
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatch description]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 896, CFSTR("matchType is undefined!"));
        v4 = CFSTR("undefined!");
        break;
      case 1:
        v4 = CFSTR("none");
        break;
      case 2:
        v4 = CFSTR("minimum");
        break;
      case 3:
        v4 = CFSTR("partial");
        break;
      case 4:
        v4 = CFSTR("complete");
        break;
      case 5:
        v4 = CFSTR("exact");
        break;
      case 10:
        v4 = CFSTR("user-defined");
        break;
      default:
        break;
    }
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{matchType:%@, cost:%ld,\noutgoing:%@,\nincoming:%@}"), v4, -[TSDMagicMoveMatch matchCost](self, "matchCost"), -[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), -[TSDMagicMoveMatch incomingObject](self, "incomingObject"));
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDMagicMoveMatch;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), -[TSDMagicMoveMatch description](&v8, sel_description), v3);
}

- (BOOL)conflictsWithMatch:(id)a3
{
  return -[TSDMagicMoveMatchObject conflictsWithMatchObject:](-[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), "conflictsWithMatchObject:", objc_msgSend(a3, "outgoingObject"))|| -[TSDMagicMoveMatchObject conflictsWithMatchObject:](-[TSDMagicMoveMatch incomingObject](self, "incomingObject"), "conflictsWithMatchObject:", objc_msgSend(a3, "incomingObject"));
}

- (TSDMagicMoveMatchObject)outgoingObject
{
  return self->_outgoingObject;
}

- (TSDMagicMoveMatchObject)incomingObject
{
  return self->_incomingObject;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (double)distance
{
  return self->_distance;
}

- (double)zOrderDistance
{
  return self->_zOrderDistance;
}

- (double)attributeMatchPercent
{
  return self->_attributeMatchPercent;
}

- (TSDTextureDescription)textureDescription
{
  return self->_textureDescription;
}

- (void)setTextureDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int64_t)matchCost
{
  return self->_matchCost;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)isShapeMatchOnlyWithoutText
{
  return self->_isShapeMatchOnlyWithoutText;
}

- (void)setIsShapeMatchOnlyWithoutText:(BOOL)a3
{
  self->_isShapeMatchOnlyWithoutText = a3;
}

@end
