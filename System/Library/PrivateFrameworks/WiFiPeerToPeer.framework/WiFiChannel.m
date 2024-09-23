@implementation WiFiChannel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiChannel)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("WiFiChannel.channelNumberKey"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiChannel.bandwidthKey"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiChannel.is2_4GHzKey"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiChannel.is5GHzKey"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiChannel.is6GHzKey"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiChannel.isDFSKey"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiChannel.extensionChannelAboveKey"));

  LOBYTE(v13) = v11;
  return -[WiFiChannel initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:](self, "initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:", v5, v6, v7, v8, v9, v10, v13);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[WiFiChannel channelNumber](self, "channelNumber"), CFSTR("WiFiChannel.channelNumberKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiChannel bandwidth](self, "bandwidth"), CFSTR("WiFiChannel.bandwidthKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel is2_4GHz](self, "is2_4GHz"), CFSTR("WiFiChannel.is2_4GHzKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel is5GHz](self, "is5GHz"), CFSTR("WiFiChannel.is5GHzKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_is6GHz, CFSTR("WiFiChannel.is6GHzKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel isDFS](self, "isDFS"), CFSTR("WiFiChannel.isDFSKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel extensionChannelAbove](self, "extensionChannelAbove"), CFSTR("WiFiChannel.extensionChannelAboveKey"));

}

- (WiFiChannel)initWithChannelNumber:(unsigned int)a3 bandwidth:(int64_t)a4 is2_4GHz:(BOOL)a5 is5GHz:(BOOL)a6 is6GHz:(BOOL)a7 isDFS:(BOOL)a8 extensionChannelAbove:(BOOL)a9
{
  WiFiChannel *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WiFiChannel;
  result = -[WiFiChannel init](&v16, sel_init);
  if (result)
  {
    result->_channelNumber = a3;
    result->_bandwidth = a4;
    result->_is2_4GHz = a5;
    result->_is5GHz = a6;
    result->_is6GHz = a7;
    result->_isDFS = a8;
    result->_extensionChannelAbove = a9;
  }
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[WiFiChannel channelNumber](self, "channelNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WiFiChannel *v4;
  unsigned __int8 *v5;
  unsigned int v6;
  int64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = (WiFiChannel *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_12:
    v12 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v5 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = -[WiFiChannel channelNumber](self, "channelNumber");
  if (v6 == objc_msgSend(v5, "channelNumber"))
  {
    v7 = -[WiFiChannel bandwidth](self, "bandwidth");
    if (v7 == objc_msgSend(v5, "bandwidth"))
    {
      v8 = -[WiFiChannel is2_4GHz](self, "is2_4GHz");
      if (v8 == objc_msgSend(v5, "is2_4GHz"))
      {
        v9 = -[WiFiChannel is5GHz](self, "is5GHz");
        if (v9 == objc_msgSend(v5, "is5GHz") && self->_is6GHz == v5[10])
        {
          v10 = -[WiFiChannel isDFS](self, "isDFS");
          if (v10 == objc_msgSend(v5, "isDFS"))
          {
            v11 = -[WiFiChannel extensionChannelAbove](self, "extensionChannelAbove");
            if (v11 == objc_msgSend(v5, "extensionChannelAbove"))
              goto LABEL_12;
          }
        }
      }
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[WiFiChannel bandwidth](self, "bandwidth");
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 == 2)
    {
      if (-[WiFiChannel extensionChannelAbove](self, "extensionChannelAbove"))
        v4 = CFSTR("+");
      else
        v4 = CFSTR("-");
    }
    else
    {
      v4 = &stru_1E6E1F318;
    }
  }
  else
  {
    v4 = CFSTR("yy");
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u%@"), -[WiFiChannel channelNumber](self, "channelNumber"), v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiChannel *v4;
  uint64_t v5;
  int64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 is6GHz;
  _BOOL8 v10;
  uint64_t v12;

  v4 = [WiFiChannel alloc];
  v5 = -[WiFiChannel channelNumber](self, "channelNumber");
  v6 = -[WiFiChannel bandwidth](self, "bandwidth");
  v7 = -[WiFiChannel is2_4GHz](self, "is2_4GHz");
  v8 = -[WiFiChannel is5GHz](self, "is5GHz");
  is6GHz = self->_is6GHz;
  v10 = -[WiFiChannel isDFS](self, "isDFS");
  LOBYTE(v12) = -[WiFiChannel extensionChannelAbove](self, "extensionChannelAbove");
  return -[WiFiChannel initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:](v4, "initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:", v5, v6, v7, v8, is6GHz, v10, v12);
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (BOOL)is2_4GHz
{
  return self->_is2_4GHz;
}

- (BOOL)is5GHz
{
  return self->_is5GHz;
}

- (BOOL)is6GHz
{
  return self->_is6GHz;
}

- (BOOL)isDFS
{
  return self->_isDFS;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (BOOL)extensionChannelAbove
{
  return self->_extensionChannelAbove;
}

@end
