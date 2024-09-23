@implementation TSWPIterativeAttachmentPositioningState

- (TSWPIterativeAttachmentPositioningState)init
{
  TSWPIterativeAttachmentPositioningState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPIterativeAttachmentPositioningState;
  result = -[TSWPIterativeAttachmentPositioningState init](&v3, sel_init);
  if (result)
    result->_smallestMismatch = 1.79769313e308;
  return result;
}

- (void)setPosition:(CGPoint)a3 mismatch:(double)a4
{
  -[TSWPIterativeAttachmentPositioningState setPosition:mismatch:afterLoop:](self, "setPosition:mismatch:afterLoop:", 0, a3.x, a3.y, a4);
}

- (void)setPosition:(CGPoint)a3 mismatch:(double)a4 afterLoop:(BOOL)a5
{
  double y;
  double x;
  NSArray *passPositions;
  NSArray *v11;
  id v12;
  double v13;
  double smallestMismatch;

  y = a3.y;
  x = a3.x;
  self->_position = a3;
  self->_mismatch = a4;
  passPositions = self->_passPositions;
  ++self->_passCount;
  if (passPositions)
  {
    v11 = -[NSArray arrayByAddingObject:](passPositions, "arrayByAddingObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3.x, a3.y));

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDBCE30]);
    v11 = (NSArray *)objc_msgSend(v12, "initWithObjects:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y), 0);
  }
  self->_passPositions = v11;
  if (!a5)
  {
    v13 = -a4;
    if (a4 >= 0.0)
      v13 = a4;
    smallestMismatch = self->_smallestMismatch;
    if (smallestMismatch < 0.0)
      smallestMismatch = -smallestMismatch;
    if (v13 < smallestMismatch)
    {
      self->_smallestMismatch = a4;
      self->_bestPosition.x = x;
      self->_bestPosition.y = y;
    }
  }
}

- (BOOL)hasLoopInLastPasses
{
  NSUInteger v3;
  NSUInteger v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;

  v3 = -[NSArray count](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "count");
  if (v3 < 2)
    return 0;
  v4 = v3;
  objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v3 - 1), "CGPointValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v4 - 2), "CGPointValue");
  v11 = v8 == v10 && v6 == v9;
  if (v4 != 2)
  {
    objc_msgSend(-[NSArray objectAtIndex:](-[TSWPIterativeAttachmentPositioningState passPositions](self, "passPositions"), "objectAtIndex:", v4 - 3), "CGPointValue");
    return v11 || v8 == v13 && v6 == v12;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPIterativeAttachmentPositioningState;
  -[TSWPIterativeAttachmentPositioningState dealloc](&v3, sel_dealloc);
}

- (unint64_t)passCount
{
  return self->_passCount;
}

- (NSArray)passPositions
{
  return self->_passPositions;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)mismatch
{
  return self->_mismatch;
}

- (double)smallestMismatch
{
  return self->_smallestMismatch;
}

- (CGPoint)bestPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_bestPosition.x;
  y = self->_bestPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
