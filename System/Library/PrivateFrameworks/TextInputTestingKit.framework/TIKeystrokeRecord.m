@implementation TIKeystrokeRecord

- (TIKeystrokeRecord)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeystrokeRecord;
  return -[TIKeystrokeRecord init](&v3, sel_init);
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (void)setIntendedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TIPointError)touchError
{
  return self->_touchError;
}

- (void)setTouchError:(id)a3
{
  objc_storeStrong((id *)&self->_touchError, a3);
}

- (TIKeyboardTouchEvent)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
  objc_storeStrong((id *)&self->_touch, a3);
}

- (NSString)touchedKey
{
  return self->_touchedKey;
}

- (void)setTouchedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)insertedKey
{
  return self->_insertedKey;
}

- (void)setInsertedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)predictionBarState
{
  return self->_predictionBarState;
}

- (void)setPredictionBarState:(id)a3
{
  objc_storeStrong((id *)&self->_predictionBarState, a3);
}

- (NSArray)inlineCompletionBarState
{
  return self->_inlineCompletionBarState;
}

- (void)setInlineCompletionBarState:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCompletionBarState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineCompletionBarState, 0);
  objc_storeStrong((id *)&self->_predictionBarState, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_insertedKey, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_touchError, 0);
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

+ (id)keystrokeRecord
{
  return objc_alloc_init(TIKeystrokeRecord);
}

@end
