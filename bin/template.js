var ctx = document.getElementById('__id__').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [__date__],
    datasets: [{
      label: '体重',
      data: [__weight__],
      borderColor: '#333',
    }, {
      label: '体温',
      data: [__temperature__],
      borderColor: '#f88',
      yAxisID: 'y2',
    }],
  },
  options: {
    scales: {
      y: {   // 体重
        min: 350,
        max: 560,
        ticks: {
          color: '#333',
          stepSize: 25,
        },
      },
      y2: { // 体温
        min: 35,
        max: 45,
        position: 'right',
        ticks: {
          color: '#f88',
          stepSize: 2.5,
        },
      },
    },
  },
});
