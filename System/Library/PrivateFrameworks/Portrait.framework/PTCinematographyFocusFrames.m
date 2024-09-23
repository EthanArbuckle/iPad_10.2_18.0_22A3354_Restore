@implementation PTCinematographyFocusFrames

- (PTCinematographyFocusFrames)initWithFrames:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PTCinematographyFocusFrames *v9;
  PTCinematographyFocusFrames *v10;
  uint64_t v11;
  PTCinematographyFocusFramesOptions *options;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusFrames;
  v9 = -[PTCinematographyFocusFrames init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_frames, a3);
    if (v8)
      v11 = objc_msgSend(v8, "copy");
    else
      v11 = objc_opt_new();
    options = v10->_options;
    v10->_options = (PTCinematographyFocusFramesOptions *)v11;

  }
  return v10;
}

- (int64_t)startIndexForLinearRackFocusPullToFrameAtIndex:(unint64_t)a3
{
  PTCinematographyFocusFramesOptions *options;
  PTCinematographyFocusFramesOptions *v6;
  PTCinematographyFocusFramesOptions *v7;
  float v8;
  float v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  int32_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float Seconds;
  void *v24;
  float v25;
  float v26;
  float v27;
  int64_t v28;
  CMTime rhs;
  CMTime v32;
  CMTime time;
  CMTime v34;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  CMTime v38[2];

  memset(&v38[1], 0, sizeof(CMTime));
  options = self->_options;
  if (options
    && (-[PTCinematographyFocusFramesOptions minimumRackFocusPullTime](options, "minimumRackFocusPullTime"),
        v6 = self->_options,
        memset(v38, 0, 24),
        v6))
  {
    -[PTCinematographyFocusFramesOptions maximumRackFocusPullTime](v6, "maximumRackFocusPullTime");
    v7 = self->_options;
  }
  else
  {
    v7 = 0;
    memset(v38, 0, 24);
  }
  -[PTCinematographyFocusFramesOptions maximumDisparityPerSecond](v7, "maximumDisparityPerSecond");
  v9 = v8;
  time1 = v38[1];
  v10 = -[PTCinematographyFocusFrames _framesIndex:earlierBy:](self, "_framesIndex:earlierBy:", a3, &time1);
  time1 = v38[1];
  time2 = v38[0];
  if (CMTimeCompare(&time1, &time2))
  {
    memset(&time1, 0, sizeof(time1));
    -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "time");
    else
      memset(&lhs, 0, sizeof(lhs));
    time2 = v38[0];
    CMTimeSubtract(&time1, &lhs, &time2);

    -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "focusDistance");
    v15 = v14;

    if (v10 < 0)
    {
      v28 = v10;
LABEL_26:
      if (v28 != -1)
        -[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:].cold.1();
      v10 = -1;
    }
    else
    {
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "time");
        else
          memset(&v34, 0, sizeof(v34));
        time2 = time1;
        v18 = CMTimeCompare(&v34, &time2);

        if (v18 < 0)
          break;
        -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
          objc_msgSend(v19, "time");
        else
          memset(&v32, 0, sizeof(v32));
        -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "time");
        else
          memset(&rhs, 0, sizeof(rhs));
        CMTimeSubtract(&time, &v32, &rhs);
        Seconds = CMTimeGetSeconds(&time);

        if (Seconds > 0.0)
        {
          -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "focusDistance");
          v26 = v25;

          v27 = fabsf((float)(v15 - v26) / Seconds);
          v10 -= v27 <= v9;
          if (v27 <= v9)
            break;
        }
        v28 = v10 - 1;
        if (v10-- <= 0)
          goto LABEL_26;
      }
    }
    ++v10;
  }
  return v10;
}

- (int64_t)_framesIndex:(unint64_t)a3 earlierBy:(id *)a4
{
  int64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int32_t v11;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;

  v5 = a3;
  if (-[NSArray count](self->_frames, "count") <= a3)
    -[PTCinematographyFocusFrames _framesIndex:earlierBy:].cold.2();
  memset(&v17, 0, sizeof(v17));
  -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "time");
  else
    memset(&lhs, 0, sizeof(lhs));
  rhs = (CMTime)*a4;
  CMTimeSubtract(&v17, &lhs, &rhs);

  if (v5 < 0)
    -[PTCinematographyFocusFrames _framesIndex:earlierBy:].cold.1();
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "time");
    else
      memset(&time1, 0, sizeof(time1));
    rhs = v17;
    v11 = CMTimeCompare(&time1, &rhs);

    if (v11 < 0)
      break;
    if (v5-- <= 0)
    {
      v5 = -1;
      return v5 + 1;
    }
  }
  return v5 + 1;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (PTCinematographyFocusFramesOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_frames, 0);
}

- (void)startIndexForLinearRackFocusPullToFrameAtIndex:.cold.1()
{
  __assert_rtn("-[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:]", "PTCinematographyFocusFrames.m", 157, "startIndex >= 0");
}

- (void)_framesIndex:earlierBy:.cold.1()
{
  __assert_rtn("-[PTCinematographyFocusFrames _framesIndex:earlierBy:]", "PTCinematographyFocusFrames.m", 176, "startIndex >= 0");
}

- (void)_framesIndex:earlierBy:.cold.2()
{
  __assert_rtn("-[PTCinematographyFocusFrames _framesIndex:earlierBy:]", "PTCinematographyFocusFrames.m", 162, "index < _frames.count");
}

@end
