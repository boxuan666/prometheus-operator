{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'general.rules',
        rules: [
          {
            alert: 'TargetDown',
            annotations: {
              message: '{{ $value }}% of the {{ $labels.job }} targets are down.',
            },
            expr: '100 * (count(up == 0) BY (job) / count(up) BY (job)) > 10',
            'for': '10m',
            labels: {
              severity: 'warning',
            },
          },
        ],
      },
    ],
  },
}
