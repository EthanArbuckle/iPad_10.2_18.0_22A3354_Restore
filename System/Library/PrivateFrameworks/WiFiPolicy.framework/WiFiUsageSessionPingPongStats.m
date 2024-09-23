@implementation WiFiUsageSessionPingPongStats

- (WiFiUsageSessionPingPongStats)initWithPingPongSequence:(id)a3
{
  id v4;
  WiFiUsageSessionPingPongStats *v5;
  WiFiUsageSessionPingPongStats *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WiFiUsageSessionPingPongStats;
  v5 = -[WiFiUsageSessionPingPongStats init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WiFiUsageSessionPingPongStats setSequence:](v5, "setSequence:", v4);
    -[WiFiUsageSessionPingPongStats setPingPongNth:](v6, "setPingPongNth:", objc_msgSend(v4, "count") - 2);
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF = 'Low RSSI'"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsLowRssiOnly:](v6, "setPingPongSequenceIsLowRssiOnly:", v7 == objc_msgSend(v9, "count"));

    v10 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF = 'Reassoc'"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsReassocOnly:](v6, "setPingPongSequenceIsReassocOnly:", v10 == objc_msgSend(v12, "count"));

    v13 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF = 'Low RSSI' OR SELF = 'Reassoc'"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsReassocOrLowRSSIOnly:](v6, "setPingPongSequenceIsReassocOrLowRSSIOnly:", v13 == objc_msgSend(v15, "count"));

    v16 = CFSTR("YES");
    if (v6->_pingPongSequenceIsLowRssiOnly)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    if (v6->_pingPongSequenceIsReassocOnly)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (!v6->_pingPongSequenceIsReassocOrLowRSSIOnly)
      v16 = CFSTR("NO");
    NSLog(CFSTR("%s pingPongSequence:%@ pingPongNth:%lu isLowRssiOnly:%@ isReassocOnly:%@ isLowRssiAndReassocOnly:%@\n"), "-[WiFiUsageSessionPingPongStats initWithPingPongSequence:]", v6->_sequence, v6->_pingPongNth, v17, v18, v16);
  }

  return v6;
}

- (unint64_t)pingPongNth
{
  return self->_pingPongNth;
}

- (void)setPingPongNth:(unint64_t)a3
{
  self->_pingPongNth = a3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (BOOL)pingPongSequenceIsLowRssiOnly
{
  return self->_pingPongSequenceIsLowRssiOnly;
}

- (void)setPingPongSequenceIsLowRssiOnly:(BOOL)a3
{
  self->_pingPongSequenceIsLowRssiOnly = a3;
}

- (BOOL)pingPongSequenceIsReassocOnly
{
  return self->_pingPongSequenceIsReassocOnly;
}

- (void)setPingPongSequenceIsReassocOnly:(BOOL)a3
{
  self->_pingPongSequenceIsReassocOnly = a3;
}

- (BOOL)pingPongSequenceIsReassocOrLowRSSIOnly
{
  return self->_pingPongSequenceIsReassocOrLowRSSIOnly;
}

- (void)setPingPongSequenceIsReassocOrLowRSSIOnly:(BOOL)a3
{
  self->_pingPongSequenceIsReassocOrLowRSSIOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
