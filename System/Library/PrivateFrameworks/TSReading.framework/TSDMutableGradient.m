@implementation TSDMutableGradient

- (void)setFirstColor:(id)a3
{
  -[TSDMutableGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[TSDMutableGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", -[NSArray count](-[TSDGradient gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (void)setFraction:(double)a3 ofStopAtIndex:(unint64_t)a4
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.mStops, "objectAtIndex:", a4), "p_setFraction:", a3);
}

@end
