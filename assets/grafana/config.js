define(['settings'],
function (Settings) {


  return new Settings({
    elasticsearch: "http://"+window.location.hostname+":{{GRAFANA_ELASTICSEARCH_PORT}}",
    graphiteUrl: "http://"+window.location.hostname+":{{GRAPHITE_WEB_PORT}}",
    default_route: '/dashboard/file/default.json',
    timezoneOffset: null,
    grafana_index: "grafana-dash",
    panel_names: [
      'text',
      'graphite'
    ]
  });
});
