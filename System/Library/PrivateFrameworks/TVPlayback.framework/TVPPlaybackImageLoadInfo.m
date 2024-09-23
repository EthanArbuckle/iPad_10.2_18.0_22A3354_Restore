@implementation TVPPlaybackImageLoadInfo

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPPlaybackImageLoadInfo requestedTime](self, "requestedTime");
  v5 = v4;
  -[TVPPlaybackImageLoadInfo maxSize](self, "maxSize");
  NSStringFromCGSize(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlaybackImageLoadInfo identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("requestedTime: %f, maxSize: %@, identifier: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)callCompletionHandlerWithImage:(id)a3 actualCMTime:(id *)a4 actualDate:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v13 = *a4;
    CMTimeGetSeconds((CMTime *)&v13);
  }
  -[TVPPlaybackImageLoadInfo dateBasedHandler](self, "dateBasedHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[TVPPlaybackImageLoadInfo identifier](self, "identifier");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TVPPlaybackImageLoadInfo requestedDate](self, "requestedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void (**)(_QWORD, _QWORD, _QWORD), id, void *, id))v10)[2](v10, v11, v8, v12, v9);
LABEL_7:

    goto LABEL_8;
  }
  -[TVPPlaybackImageLoadInfo timeBasedHandler](self, "timeBasedHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TVPPlaybackImageLoadInfo identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlaybackImageLoadInfo requestedTime](self, "requestedTime");
    ((void (**)(_QWORD, void *, id))v11)[2](v11, v12, v8);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong(&self->_identifier, a3);
}

- (double)requestedTime
{
  return self->_requestedTime;
}

- (void)setRequestedTime:(double)a3
{
  self->_requestedTime = a3;
}

- (NSDate)requestedDate
{
  return self->_requestedDate;
}

- (void)setRequestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestedDate, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestedCMTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setRequestedCMTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_requestedCMTime.epoch = a3->var3;
  *(_OWORD *)&self->_requestedCMTime.value = v3;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (id)timeBasedHandler
{
  return self->_timeBasedHandler;
}

- (void)setTimeBasedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)dateBasedHandler
{
  return self->_dateBasedHandler;
}

- (void)setDateBasedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateBasedHandler, 0);
  objc_storeStrong(&self->_timeBasedHandler, 0);
  objc_storeStrong((id *)&self->_requestedDate, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end
