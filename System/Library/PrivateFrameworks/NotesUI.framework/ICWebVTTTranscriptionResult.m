@implementation ICWebVTTTranscriptionResult

- (NSString)text
{
  return self->text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isEmptyCueOut
{
  return self->isEmptyCueOut;
}

- (void)setIsEmptyCueOut:(BOOL)a3
{
  self->isEmptyCueOut = a3;
}

- (NSError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->text, 0);
}

@end
