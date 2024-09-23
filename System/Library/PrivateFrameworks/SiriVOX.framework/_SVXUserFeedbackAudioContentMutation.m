@implementation _SVXUserFeedbackAudioContentMutation

- (_SVXUserFeedbackAudioContentMutation)init
{
  return -[_SVXUserFeedbackAudioContentMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXUserFeedbackAudioContentMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXUserFeedbackAudioContentMutation *v6;
  _SVXUserFeedbackAudioContentMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackAudioContentMutation;
  v6 = -[_SVXUserFeedbackAudioContentMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setNumberOfLoops:(unint64_t)a3
{
  self->_numberOfLoops = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXUserFeedbackAudioContent *baseModel;
  SVXUserFeedbackAudioContent *v4;
  SVXUserFeedbackAudioContent *v5;
  NSURL *v6;
  NSURL *v7;
  char mutationFlags;
  unint64_t numberOfLoops;
  double fadeInDuration;
  double fadeOutDuration;
  double v12;
  double v13;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXUserFeedbackAudioContent initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:]([SVXUserFeedbackAudioContent alloc], "initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:", self->_itemURL, self->_numberOfLoops, self->_fadeInDuration, self->_fadeOutDuration);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v6 = self->_itemURL;
    }
    else
    {
      -[SVXUserFeedbackAudioContent itemURL](baseModel, "itemURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
    {
      numberOfLoops = self->_numberOfLoops;
      if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      {
LABEL_11:
        fadeInDuration = self->_fadeInDuration;
        if ((mutationFlags & 0x10) != 0)
        {
LABEL_12:
          fadeOutDuration = self->_fadeOutDuration;
LABEL_16:
          v5 = -[SVXUserFeedbackAudioContent initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:]([SVXUserFeedbackAudioContent alloc], "initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:", v7, numberOfLoops, fadeInDuration, fadeOutDuration);

          return v5;
        }
LABEL_15:
        -[SVXUserFeedbackAudioContent fadeOutDuration](self->_baseModel, "fadeOutDuration");
        fadeOutDuration = v13;
        goto LABEL_16;
      }
    }
    else
    {
      numberOfLoops = -[SVXUserFeedbackAudioContent numberOfLoops](self->_baseModel, "numberOfLoops");
      mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 8) != 0)
        goto LABEL_11;
    }
    -[SVXUserFeedbackAudioContent fadeInDuration](self->_baseModel, "fadeInDuration");
    fadeInDuration = v12;
    if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v4 = (SVXUserFeedbackAudioContent *)-[SVXUserFeedbackAudioContent copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
