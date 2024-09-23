@implementation ProgressTracker

- (double)phaseTracker
{
  return self->_phaseTracker;
}

- (double)getProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = *-[ProgressTracker phaseTracker](self, "phaseTracker");
  v4 = 0.0;
  v5 = 0.0;
  if (v3 >= 1.0)
  {
    v6 = -[ProgressTracker phaseTracker](self, "phaseTracker", v3)[4];
    v3 = v6 / *-[ProgressTracker phaseTracker](self, "phaseTracker");
    v5 = v3 * 25.0;
  }
  if (-[ProgressTracker phaseTracker](self, "phaseTracker", v3)[1] >= 1.0)
  {
    v7 = -[ProgressTracker phaseTracker](self, "phaseTracker")[5];
    v4 = v7 / -[ProgressTracker phaseTracker](self, "phaseTracker")[1] * 25.0;
  }
  v8 = 0.0;
  v9 = 0.0;
  if (-[ProgressTracker phaseTracker](self, "phaseTracker")[2] >= 1.0)
  {
    v10 = -[ProgressTracker phaseTracker](self, "phaseTracker")[6];
    v9 = v10 / -[ProgressTracker phaseTracker](self, "phaseTracker")[2] * 25.0;
  }
  if (-[ProgressTracker phaseTracker](self, "phaseTracker")[3] >= 1.0)
  {
    v11 = -[ProgressTracker phaseTracker](self, "phaseTracker")[7];
    v8 = v11 / -[ProgressTracker phaseTracker](self, "phaseTracker")[3] * 25.0;
  }
  return v5 + v4 + v9 + v8;
}

- (double)increaseCountForPhase:(int)a3
{
  double *v5;

  v5 = -[ProgressTracker phaseTracker](self, "phaseTracker");
  a3 += 4;
  v5[a3] = v5[a3] + 1.0;
  return -[ProgressTracker phaseTracker](self, "phaseTracker")[a3];
}

@end
