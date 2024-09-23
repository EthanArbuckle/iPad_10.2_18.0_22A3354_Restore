@implementation CLSerializableStrideCalEntry

- (CLSerializableStrideCalEntry)initWithStrideCalEntry:(const CLStrideCalEntry *)a3
{
  CLSerializableStrideCalEntry *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSerializableStrideCalEntry;
  result = -[CLSerializableStrideCalEntry init](&v11, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->recordId;
    v6 = *(_OWORD *)&a3->pacebin;
    v7 = *(_OWORD *)&a3->kvalueTrack;
    *(_OWORD *)&result->_entry.endTime = *(_OWORD *)&a3->endTime;
    *(_OWORD *)&result->_entry.kvalueTrack = v7;
    *(_OWORD *)&result->_entry.pacebin = v6;
    *(_OWORD *)&result->_entry.recordId = v5;
    v8 = *(_OWORD *)&a3->steps;
    v9 = *(_OWORD *)&a3->percentGrade;
    v10 = *(_OWORD *)&a3->timestamp;
    *(_QWORD *)&result->_entry.runningFormStrideLengthMetrics = *(_QWORD *)&a3->runningFormStrideLengthMetrics;
    *(_OWORD *)&result->_entry.timestamp = v10;
    *(_OWORD *)&result->_entry.percentGrade = v9;
    *(_OWORD *)&result->_entry.steps = v8;
  }
  return result;
}

- (void)getStrideCalEntry:(CLStrideCalEntry *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->_entry.recordId;
  v4 = *(_OWORD *)&self->_entry.pacebin;
  v5 = *(_OWORD *)&self->_entry.endTime;
  *(_OWORD *)&a3->kvalueTrack = *(_OWORD *)&self->_entry.kvalueTrack;
  *(_OWORD *)&a3->endTime = v5;
  *(_OWORD *)&a3->recordId = v3;
  *(_OWORD *)&a3->pacebin = v4;
  v6 = *(_OWORD *)&self->_entry.steps;
  v7 = *(_OWORD *)&self->_entry.percentGrade;
  v8 = *(_OWORD *)&self->_entry.timestamp;
  *(_QWORD *)&a3->runningFormStrideLengthMetrics = *(_QWORD *)&self->_entry.runningFormStrideLengthMetrics;
  *(_OWORD *)&a3->percentGrade = v7;
  *(_OWORD *)&a3->timestamp = v8;
  *(_OWORD *)&a3->steps = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_entry.startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_entry.endTime);
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.pacebin, CFSTR("pacebin"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kvalue"), self->_entry.kvalue);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kvalueTrack"), self->_entry.kvalueTrack);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("score"), self->_entry.score);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("distance"), self->_entry.distance);
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.steps, CFSTR("steps"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.session, CFSTR("session"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speed"), self->_entry.speed);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("percentGrade"), self->_entry.percentGrade);
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.gpsSource, CFSTR("gpsSource"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timestamp"), self->_entry.timestamp);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("runningFormStrideLength"), self->_entry.runningFormStrideLength);
  objc_msgSend(a3, "encodeInt:forKey:", self->_entry.runningFormStrideLengthMetrics, CFSTR("runningFormStrideLengthMetrics"));
}

- (CLSerializableStrideCalEntry)initWithCoder:(id)a3
{
  CLSerializableStrideCalEntry *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSerializableStrideCalEntry;
  v4 = -[CLSerializableStrideCalEntry init](&v16, "init");
  if (v4)
  {
    v4->_entry.recordId = objc_msgSend(a3, "decodeIntForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_entry.startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_entry.endTime = v6;
    v4->_entry.pacebin = objc_msgSend(a3, "decodeIntForKey:", CFSTR("pacebin"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kvalue"));
    v4->_entry.kvalue = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kvalueTrack"));
    v4->_entry.kvalueTrack = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("score"));
    v4->_entry.score = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("distance"));
    v4->_entry.distance = v10;
    v4->_entry.steps = objc_msgSend(a3, "decodeIntForKey:", CFSTR("steps"));
    v4->_entry.session = objc_msgSend(a3, "decodeIntForKey:", CFSTR("session"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speed"));
    v4->_entry.speed = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("percentGrade"));
    v4->_entry.percentGrade = v12;
    v4->_entry.gpsSource = objc_msgSend(a3, "decodeIntForKey:", CFSTR("gpsSource"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timestamp"));
    v4->_entry.timestamp = v13;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("runningFormStrideLength"));
    v4->_entry.runningFormStrideLength = v14;
    v4->_entry.runningFormStrideLengthMetrics = objc_msgSend(a3, "decodeIntForKey:", CFSTR("runningFormStrideLengthMetrics"));
  }
  return v4;
}

@end
