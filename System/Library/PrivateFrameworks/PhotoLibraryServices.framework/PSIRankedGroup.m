@implementation PSIRankedGroup

- (PSIRankedGroup)initWithGroup:(id)a3 score:(double)a4
{
  id v7;
  PSIRankedGroup *v8;
  PSIRankedGroup *v9;

  v7 = a3;
  v8 = -[PSIRankedGroup init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a3);
    v9->_score = a4;
  }

  return v9;
}

- (PSIGroup)group
{
  return self->_group;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
