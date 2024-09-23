@implementation BSUIPurchase

- (BOOL)isAudioBook
{
  return self->_isAudioBook;
}

- (void)setIsAudioBook:(BOOL)a3
{
  self->_isAudioBook = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
