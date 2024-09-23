@implementation _PIPosterLayoutResult

- (PFPosterLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
