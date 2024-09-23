@implementation _LTSpeechDataQueue

- (id)initForSeconds:(double)a3
{
  _LTSpeechDataQueue *v4;
  _LTSpeechDataQueue *v5;
  _LTSpeechDataQueue *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTSpeechDataQueue;
  v4 = -[_LTSpeechDataQueue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxFrames = (unint64_t)(a3 * 16000.0);
    v6 = v4;
  }

  return v5;
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  unint64_t v5;
  _LTSpeechDataQueueNode *v6;
  _LTSpeechDataQueueNode *v7;
  _LTSpeechDataQueueNode *head;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  _LTSpeechDataQueueNode *v12;
  _LTSpeechDataQueueNode *tail;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (self->_currentFrames + (v5 >> 1) > self->_maxFrames)
  {
    v6 = self->_head;
    -[_LTSpeechDataQueueNode next](v6, "next");
    v7 = (_LTSpeechDataQueueNode *)objc_claimAutoreleasedReturnValue();
    head = self->_head;
    self->_head = v7;

    -[_LTSpeechDataQueueNode data](v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    self->_currentFrames -= v10 >> 1;
  }
  v11 = v5 >> 1;
  v12 = objc_alloc_init(_LTSpeechDataQueueNode);
  -[_LTSpeechDataQueueNode setData:](v12, "setData:", v4);

  if (!self->_head)
    objc_storeStrong((id *)&self->_head, v12);
  -[_LTSpeechDataQueueNode setNext:](self->_tail, "setNext:", v12);
  tail = self->_tail;
  self->_tail = v12;

  self->_currentFrames += v11;
}

- (void)consumeAll:(id)a3
{
  _LTSpeechDataQueueNode *v4;
  _LTSpeechDataQueueNode *head;
  _LTSpeechDataQueueNode *tail;
  void *v7;
  uint64_t v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v4 = self->_head;
  head = self->_head;
  self->_head = 0;

  tail = self->_tail;
  self->_tail = 0;

  if (v4)
  {
    do
    {
      -[_LTSpeechDataQueueNode data](v4, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v7);

      -[_LTSpeechDataQueueNode next](v4, "next");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (_LTSpeechDataQueueNode *)v8;
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end
