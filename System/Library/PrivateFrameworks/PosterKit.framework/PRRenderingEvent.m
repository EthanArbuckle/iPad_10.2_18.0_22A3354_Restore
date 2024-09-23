@implementation PRRenderingEvent

- (PRRenderingEvent)initWithType:(id)a3
{
  return -[PRRenderingEvent initWithType:location:](self, "initWithType:location:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (PRRenderingEvent)initWithType:(id)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  PRRenderingEvent *v9;
  PRRenderingEvent *v10;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRRenderingEvent;
  v9 = -[PRRenderingEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    v10->_location.x = x;
    v10->_location.y = y;
  }

  return v10;
}

- (PRRenderingEvent)initWithAction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PRRenderingEvent *v10;

  v4 = a3;
  objc_msgSend(v4, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v7 = v6;
  v9 = v8;

  v10 = -[PRRenderingEvent initWithType:location:](self, "initWithType:location:", v5, v7, v9);
  return v10;
}

- (id)newAction
{
  return -[PRRenderingEventAction initWithType:location:]([PRRenderingEventAction alloc], "initWithType:location:", self->_type, self->_location.x, self->_location.y);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
