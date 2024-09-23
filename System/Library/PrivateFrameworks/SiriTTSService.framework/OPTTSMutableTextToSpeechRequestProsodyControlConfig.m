@implementation OPTTSMutableTextToSpeechRequestProsodyControlConfig

- (OPTTSMutableTextToSpeechRequestProsodyControlConfig)init
{
  OPTTSMutableTextToSpeechRequestProsodyControlConfig *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechRequestProsodyControlConfig;
  v2 = -[OPTTSMutableTextToSpeechRequestProsodyControlConfig init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->super._storage, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (float)global_rate
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_rate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_rate:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_pitch
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_pitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_pitch:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_energy
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_energy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_energy:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_sent_pitch
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_sent_pitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_sent_pitch:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_sent_pitchrange
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_sent_pitchrange"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_sent_pitchrange:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_sent_duration
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_sent_duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_sent_duration:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_sent_energy
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_sent_energy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_sent_energy:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)global_sent_tilt
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("global_sent_tilt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGlobal_sent_tilt:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
