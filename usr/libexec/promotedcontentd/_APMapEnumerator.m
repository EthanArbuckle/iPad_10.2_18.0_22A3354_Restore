@implementation _APMapEnumerator

- (id)nextObject
{
  void *v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_APMapEnumerator srcEnumerator](self, "srcEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));

  if (v4)
  {
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_APMapEnumerator transformationBlock](self, "transformationBlock"));
    v6 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSEnumerator)srcEnumerator
{
  return self->_srcEnumerator;
}

- (void)setSrcEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_srcEnumerator, a3);
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformationBlock, 0);
  objc_storeStrong((id *)&self->_srcEnumerator, 0);
}

@end
