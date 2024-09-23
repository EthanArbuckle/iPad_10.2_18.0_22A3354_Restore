@implementation TIKeyboardInputManagerStickerTask

- (TIWordSearchCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_candidateResultSet, a3);
}

- (id)stickerCompletionHandler
{
  return self->_stickerCompletionHandler;
}

- (void)setStickerCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stickerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
}

@end
