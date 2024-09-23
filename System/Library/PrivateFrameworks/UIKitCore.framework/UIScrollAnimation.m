@implementation UIScrollAnimation

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (void)setProgress:(float)a3
{
  objc_msgSend(self->super._target, "setContentOffset:", vrndmq_f64(vaddq_f64((float64x2_t)self->_startPoint, vmulq_n_f64(vsubq_f64((float64x2_t)self->_endPoint, (float64x2_t)self->_startPoint), a3))));
}

@end
