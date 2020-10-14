import http from 'k6/http';

export default function (data) {
  const response = http.get("http://monitor:5000/docs");
};
