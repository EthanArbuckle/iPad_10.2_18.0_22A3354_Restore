@implementation _CHWorkoutDetailSwimSetTableItem

- (int64_t)setIndex
{
  return self->_setIndex;
}

- (void)setSetIndex:(int64_t)a3
{
  self->_setIndex = a3;
}

- (CHWorkoutSwimmingSet)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_storeStrong((id *)&self->_set, a3);
}

- (id)paceFormatUpdatedBlock
{
  return self->_paceFormatUpdatedBlock;
}

- (void)setPaceFormatUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_paceFormatUpdatedBlock, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end
