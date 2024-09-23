@implementation VGUserBodyPoseGuidanceResult

- (FrameRejectionState)rejection
{
  NSString *v5;
  uint64_t v6;
  NSDictionary *debugDictionary;
  FrameRejectionState *result;

  retstr->reason = self->_rejection.reason;
  v5 = self->_rejection.description;
  v6 = *(_QWORD *)&self->_rejection.outOfFovOffset;
  debugDictionary = self->_rejection.debugDictionary;
  retstr->description = v5;
  *(_QWORD *)&retstr->outOfFovOffset = v6;
  result = debugDictionary;
  retstr->debugDictionary = (NSDictionary *)result;
  return result;
}

- (void)setRejection:(FrameRejectionState *)a3
{
  self->_rejection.reason = a3->reason;
  objc_storeStrong((id *)&self->_rejection.description, a3->description);
  *(_QWORD *)&self->_rejection.outOfFovOffset = *(_QWORD *)&a3->outOfFovOffset;
  objc_storeStrong((id *)&self->_rejection.debugDictionary, a3->debugDictionary);

}

- (VGBodyPoseFrameState)frameState
{
  return self->_frameState;
}

- (void)setFrameState:(id)a3
{
  objc_storeStrong((id *)&self->_frameState, a3);
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_frameState, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
