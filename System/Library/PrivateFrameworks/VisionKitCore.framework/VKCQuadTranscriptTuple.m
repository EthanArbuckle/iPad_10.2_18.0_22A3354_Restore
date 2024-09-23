@implementation VKCQuadTranscriptTuple

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (NSString)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
  objc_storeStrong((id *)&self->_transcript, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcript, 0);
  objc_storeStrong((id *)&self->_quad, 0);
}

@end
