@implementation CMStrideCalDataContainer

- (CMStrideCalDataContainer)initWithTrack:(id)a3 session:(int64_t)a4
{
  CMStrideCalDataContainer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMStrideCalDataContainer;
  v6 = -[CMStrideCalDataContainer init](&v8, "init");
  if (v6)
  {
    v6->_track = (CalibrationTrack *)a3;
    v6->_session = a4;
    v6->_gradient = 0.0;
    v6->_gradientValidity = -1;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalDataContainer)initWithCoder:(id)a3
{
  uint64_t v4;
  CMStrideCalDataContainer *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMStrideCalDataContainer;
  v5 = -[CMStrideCalDataContainer init](&v8, "init");
  if (v5)
  {
    v5->_track = (CalibrationTrack *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CalibrationTrack, v4), CFSTR("kCMStrideCalDataContainerKeyTrack"));
    v5->_session = (int64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("kCMStrideCalDataContainerKeySession"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kCMStrideCalDataContainerKeyGradient"));
    v5->_gradient = v6;
    v5->_gradientValidity = (int64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("kCMStrideCalDataContainerKeyGradientValidity"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_track, CFSTR("kCMStrideCalDataContainerKeyTrack"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_session, CFSTR("kCMStrideCalDataContainerKeySession"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kCMStrideCalDataContainerKeyGradient"), self->_gradient);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_gradientValidity, CFSTR("kCMStrideCalDataContainerKeyGradientValidity"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalDataContainer;
  -[CMStrideCalDataContainer dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  CalibrationTrack *v5;
  id v6;
  uint64_t v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CMStrideCalDataContainer track](self, "track");
  v6 = +[CMWorkout workoutName:](CMWorkout, "workoutName:", -[CMStrideCalDataContainer session](self, "session"));
  -[CMStrideCalDataContainer gradient](self, "gradient");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,Track,%@,Session,%@,Gradient,%0.6f,GradientValid,%ld"), v4, v5, v6, v7, -[CMStrideCalDataContainer gradientValidity](self, "gradientValidity"));
}

- (void)setGradient:(double)a3
{
  self->_gradient = a3;
  self->_gradientValidity = fabs(a3) <= 2.0;
}

- (CalibrationTrack)track
{
  return self->_track;
}

- (int64_t)session
{
  return self->_session;
}

- (double)gradient
{
  return self->_gradient;
}

- (int64_t)gradientValidity
{
  return self->_gradientValidity;
}

@end
