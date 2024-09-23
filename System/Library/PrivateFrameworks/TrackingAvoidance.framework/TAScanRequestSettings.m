@implementation TAScanRequestSettings

- (TAScanRequestSettings)initWithDefaults
{
  return -[TAScanRequestSettings initWithMinVisitEntryDisplayOnDurationOrDefault:minInterVisitDisplayOnDurationOrDefault:interVisitScanDelayOrDefault:maxInterVisitScanRequestsOrDefault:](self, "initWithMinVisitEntryDisplayOnDurationOrDefault:minInterVisitDisplayOnDurationOrDefault:interVisitScanDelayOrDefault:maxInterVisitScanRequestsOrDefault:", 0, 0, 0, 0);
}

- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDuration:(double)a3 minInterVisitDisplayOnDuration:(double)a4 interVisitScanDelay:(double)a5 maxInterVisitScanRequests:(unint64_t)a6
{
  TAScanRequestSettings *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TAScanRequestSettings;
  result = -[TAScanRequestSettings init](&v11, sel_init);
  if (result)
  {
    result->_minVisitEntryDisplayOnDuration = a3;
    result->_minInterVisitDisplayOnDuration = a4;
    result->_interVisitScanDelay = a5;
    result->_maxInterVisitScanRequests = a6;
  }
  return result;
}

- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDurationOrDefault:(id)a3 minInterVisitDisplayOnDurationOrDefault:(id)a4 interVisitScanDelayOrDefault:(id)a5 maxInterVisitScanRequestsOrDefault:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  TAScanRequestSettings *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 90.0;
  v15 = 90.0;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v15 = v16;
  }
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v14 = v17;
  }
  if (!v12)
  {
    v19 = 660.0;
    if (v13)
      goto LABEL_7;
LABEL_9:
    v20 = 2;
    goto LABEL_10;
  }
  objc_msgSend(v12, "doubleValue");
  v19 = v18;
  if (!v13)
    goto LABEL_9;
LABEL_7:
  v20 = objc_msgSend(v13, "unsignedIntegerValue");
LABEL_10:
  v21 = -[TAScanRequestSettings initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:](self, "initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:", v20, v15, v14, v19);

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TAScanRequestSettings initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:](+[TAScanRequestSettings allocWithZone:](TAScanRequestSettings, "allocWithZone:", a3), "initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:", self->_maxInterVisitScanRequests, self->_minVisitEntryDisplayOnDuration, self->_minInterVisitDisplayOnDuration, self->_interVisitScanDelay);
}

- (BOOL)isEqual:(id)a3
{
  TAScanRequestSettings *v4;
  TAScanRequestSettings *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  BOOL v16;

  v4 = (TAScanRequestSettings *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TAScanRequestSettings minVisitEntryDisplayOnDuration](self, "minVisitEntryDisplayOnDuration");
      v7 = v6;
      -[TAScanRequestSettings minVisitEntryDisplayOnDuration](v5, "minVisitEntryDisplayOnDuration");
      if (v7 == v8
        && (-[TAScanRequestSettings minInterVisitDisplayOnDuration](self, "minInterVisitDisplayOnDuration"),
            v10 = v9,
            -[TAScanRequestSettings minInterVisitDisplayOnDuration](v5, "minInterVisitDisplayOnDuration"),
            v10 == v11)
        && (-[TAScanRequestSettings interVisitScanDelay](self, "interVisitScanDelay"),
            v13 = v12,
            -[TAScanRequestSettings interVisitScanDelay](v5, "interVisitScanDelay"),
            v13 == v14))
      {
        v15 = -[TAScanRequestSettings maxInterVisitScanRequests](self, "maxInterVisitScanRequests");
        v16 = v15 == -[TAScanRequestSettings maxInterVisitScanRequests](v5, "maxInterVisitScanRequests");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAScanRequestSettings)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("VisitDisplayOn"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("IntervisitDisplayOn"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ScanDelay"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaxScanReqs"));

  return -[TAScanRequestSettings initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:](self, "initWithMinVisitEntryDisplayOnDuration:minInterVisitDisplayOnDuration:interVisitScanDelay:maxInterVisitScanRequests:", v11, v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  double minVisitEntryDisplayOnDuration;
  id v5;

  minVisitEntryDisplayOnDuration = self->_minVisitEntryDisplayOnDuration;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("VisitDisplayOn"), minVisitEntryDisplayOnDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("IntervisitDisplayOn"), self->_minInterVisitDisplayOnDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ScanDelay"), self->_interVisitScanDelay);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxInterVisitScanRequests, CFSTR("MaxScanReqs"));

}

- (double)minVisitEntryDisplayOnDuration
{
  return self->_minVisitEntryDisplayOnDuration;
}

- (double)minInterVisitDisplayOnDuration
{
  return self->_minInterVisitDisplayOnDuration;
}

- (double)interVisitScanDelay
{
  return self->_interVisitScanDelay;
}

- (unint64_t)maxInterVisitScanRequests
{
  return self->_maxInterVisitScanRequests;
}

@end
