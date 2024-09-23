@implementation KernelTaskMonitorStats

- (double)cpu_time
{
  return self->_cpu_time;
}

- (void)setCpu_time:(double)a3
{
  self->_cpu_time = a3;
}

- (unint64_t)cpu_energy_p
{
  return self->_cpu_energy_p;
}

- (void)setCpu_energy_p:(unint64_t)a3
{
  self->_cpu_energy_p = a3;
}

- (unint64_t)cpu_energy_e
{
  return self->_cpu_energy_e;
}

- (void)setCpu_energy_e:(unint64_t)a3
{
  self->_cpu_energy_e = a3;
}

- (unint64_t)thread_id
{
  return self->_thread_id;
}

- (void)setThread_id:(unint64_t)a3
{
  self->_thread_id = a3;
}

- (NSString)thread_name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThread_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread_name, 0);
}

@end
