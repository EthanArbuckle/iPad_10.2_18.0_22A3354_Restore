@implementation _PSSharingContactRankerScoredContact

- (_PSSharingContactRankerScoredContact)initWithScore:(double)a3 interaction:(id)a4
{
  id v6;
  _PSSharingContactRankerScoredContact *v7;
  _PSSharingContactRankerScoredContact *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_PSSharingContactRankerScoredContact;
  v7 = -[_PSSharingContactRankerScoredContact init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_PSSharingContactRankerScoredContact setScore:](v7, "setScore:", a3);
    -[_PSSharingContactRankerScoredContact setInteraction:](v8, "setInteraction:", v6);
  }

  return v8;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (_CDInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
