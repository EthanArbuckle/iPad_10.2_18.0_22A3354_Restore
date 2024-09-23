@implementation SBRootSettings

- (SBAttentionAwarenessSettings)attentionAwarenessSettings
{
  return (SBAttentionAwarenessSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttentionAwarenessSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessSettings, 0);
}

@end
