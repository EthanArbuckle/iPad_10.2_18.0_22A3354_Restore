@implementation SAStrokeViewProvider

- (id)strokeViewWithDelegate:(id)a3
{
  _TtC15StrokeAnimation10StrokeView *v4;
  _TtC15StrokeAnimation10StrokeView *v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init(_TtC15StrokeAnimation10StrokeView);
  -[StrokeView setInteractionDelegate:](v5, "setInteractionDelegate:", location[0]);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (SAStrokeVisualResponse)strokeView
{
  return self->_strokeView;
}

- (void)setStrokeView:(id)a3
{
  objc_storeStrong((id *)&self->_strokeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeView, 0);
}

@end
