@implementation CLSerializablePredictedWalkDistanceBout

- (CLSerializablePredictedWalkDistanceBout)initWithPredictedWalkDistanceBout:(const CLPredictedWalkDistanceBoutEntry *)a3
{
  CLSerializablePredictedWalkDistanceBout *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSerializablePredictedWalkDistanceBout;
  result = -[CLSerializablePredictedWalkDistanceBout init](&v11, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->recordId;
    v6 = *(_OWORD *)&a3->endTime;
    v7 = *(_OWORD *)&a3->distance;
    *(_OWORD *)&result->_bout.elevationAscended = *(_OWORD *)&a3->elevationAscended;
    *(_OWORD *)&result->_bout.distance = v7;
    *(_OWORD *)&result->_bout.endTime = v6;
    *(_OWORD *)&result->_bout.recordId = v5;
    v8 = *(_OWORD *)&a3->distanceGPS;
    v9 = *(_OWORD *)&a3->cadence;
    v10 = *(_OWORD *)&a3->speed;
    result->_bout.supportsBout = a3->supportsBout;
    *(_OWORD *)&result->_bout.speed = v10;
    *(_OWORD *)&result->_bout.cadence = v9;
    *(_OWORD *)&result->_bout.distanceGPS = v8;
  }
  return result;
}

- (void)getPredictedWalkDistanceBout:(CLPredictedWalkDistanceBoutEntry *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->_bout.recordId;
  v4 = *(_OWORD *)&self->_bout.endTime;
  v5 = *(_OWORD *)&self->_bout.elevationAscended;
  *(_OWORD *)&a3->distance = *(_OWORD *)&self->_bout.distance;
  *(_OWORD *)&a3->elevationAscended = v5;
  *(_OWORD *)&a3->recordId = v3;
  *(_OWORD *)&a3->endTime = v4;
  v6 = *(_OWORD *)&self->_bout.distanceGPS;
  v7 = *(_OWORD *)&self->_bout.cadence;
  v8 = *(_OWORD *)&self->_bout.speed;
  a3->supportsBout = self->_bout.supportsBout;
  *(_OWORD *)&a3->cadence = v7;
  *(_OWORD *)&a3->speed = v8;
  *(_OWORD *)&a3->distanceGPS = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_bout.startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_bout.endTime);
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.stepCount, CFSTR("stepCount"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("distance"), self->_bout.distance);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("activeTime"), self->_bout.activeTime);
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.elevationAscended, CFSTR("elevationAscended"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.elevationDescended, CFSTR("elevationDescended"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.stepCountGPS, CFSTR("stepCountGPS"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("distanceGPS"), self->_bout.distanceGPS);
  objc_msgSend(a3, "encodeInt:forKey:", self->_bout.boutType, CFSTR("boutType"));
}

- (CLSerializablePredictedWalkDistanceBout)initWithCoder:(id)a3
{
  char *v4;
  CLSerializablePredictedWalkDistanceBout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSerializablePredictedWalkDistanceBout;
  v4 = -[CLSerializablePredictedWalkDistanceBout init](&v12, "init");
  v5 = (CLSerializablePredictedWalkDistanceBout *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 3) = 0;
    *((_DWORD *)v4 + 8) = 0;
    *((_QWORD *)v4 + 6) = 0;
    *((_QWORD *)v4 + 7) = 0;
    *((_QWORD *)v4 + 5) = 0;
    *((_DWORD *)v4 + 16) = 0;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 104) = 0u;
    *((_QWORD *)v4 + 15) = 0;
    *((_DWORD *)v4 + 2) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_bout.startTime = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_bout.endTime = v7;
    v5->_bout.stepCount = objc_msgSend(a3, "decodeIntForKey:", CFSTR("stepCount"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("distance"));
    v5->_bout.distance = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("activeTime"));
    v5->_bout.activeTime = v9;
    v5->_bout.elevationAscended = objc_msgSend(a3, "decodeIntForKey:", CFSTR("elevationAscended"));
    v5->_bout.elevationDescended = objc_msgSend(a3, "decodeIntForKey:", CFSTR("elevationDescended"));
    v5->_bout.stepCountGPS = objc_msgSend(a3, "decodeIntForKey:", CFSTR("stepCountGPS"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("distanceGPS"));
    v5->_bout.distanceGPS = v10;
    v5->_bout.boutType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("boutType"));
  }
  return v5;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 16) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
