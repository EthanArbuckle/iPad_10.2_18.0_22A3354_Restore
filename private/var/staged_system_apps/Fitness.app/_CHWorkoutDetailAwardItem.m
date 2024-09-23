@implementation _CHWorkoutDetailAwardItem

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_achievement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end
