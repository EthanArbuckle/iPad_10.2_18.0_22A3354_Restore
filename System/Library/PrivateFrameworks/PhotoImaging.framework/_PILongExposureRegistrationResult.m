@implementation _PILongExposureRegistrationResult

- (VNImageHomographicAlignmentObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var1.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
