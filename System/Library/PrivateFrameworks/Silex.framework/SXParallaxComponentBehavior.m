@implementation SXParallaxComponentBehavior

- (int)directionWithValue:(id)a3 withType:(int)a4
{
  id v5;
  int v6;
  int v7;

  v5 = a3;
  if (!-[SXParallaxComponentBehavior cachedDirection](self, "cachedDirection"))
  {
    self->_cachedDirection = 1;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("down")))
    {
      v7 = 3;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("up")))
      {
LABEL_8:
        v6 = 1;
        goto LABEL_9;
      }
      v7 = 2;
    }
    self->_cachedDirection = v7;
    goto LABEL_8;
  }
  v6 = -[SXParallaxComponentBehavior cachedDirection](self, "cachedDirection");
LABEL_9:

  return v6;
}

- (Class)handlerClassForComponent:(id)a3
{
  return (Class)objc_opt_class();
}

- (int)cachedDirection
{
  return self->_cachedDirection;
}

@end
