@implementation ASKLoadResourceOperation

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[ASKLoadResourceOperation outputBlock](self, "outputBlock"));
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    -[ASKLoadResourceOperation setOutputBlock:](self, "setOutputBlock:", 0);
  }

}

- (void)main
{
  -[ASKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, 0);
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOutputBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
}

@end
